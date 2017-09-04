
require_relative 'graph_manager'

module VisualCallGraph
  extend self

  def trace(options = {})
    unless block_given?
      puts "Block required"
      return
    end

    graph = GraphManager.new(options)

    trace =
    TracePoint.new(:call, :return) do |event|
      case event.event
      when :return then graph.pop
      when :call   then graph.add_edges(event)
      end
    end

    trace.enable
    yield
    trace.disable

    graph.output(png: "#{Dir.pwd}/call_graph.png")

    puts "Call graph created with a total of #{node_count(graph)}."
  end

  def node_count(graph)
    "#{graph.node_count} #{(graph.node_count > 1 ? 'nodes' : 'node')}"
  end
end

