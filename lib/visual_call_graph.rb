
require 'graphviz'

module VisualCallGraph
  extend self

  def trace
    @stack  = ["start"]
    @edges  = []

    @g = GraphViz.new(:G, :type => :digraph)

    @g.add_node("start")

    trace =
    TracePoint.new(:call, :return) do |event|
      case event.event
      when :return then @stack.pop
      when :call   then add_edges(event)
      end
    end

    trace.enable
    yield
    trace.disable

    @g.output(png: "call_graph.png")

    puts "Call graph created with a total of #{@g.node_count} #{@g.node_count > 1 ? 'nodes' : 'node'}."
  end

  private

  def add_edges(event)
    node = "#{event.defined_class}##{event.method_id}".freeze

    @g.add_node(node)
    @stack << node

    edge = [@stack[-2], @stack[-1]]

    return if @edges.include?(edge)

    @edges << edge
    @g.add_edge(*@edges.last)
  end
end
