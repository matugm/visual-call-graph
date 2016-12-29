
require 'graphviz'

class GraphManager
  def initialize
    @stack  = ["start"]
    @edges  = []

    @g = GraphViz.new(:G, :type => :digraph)

    @g.add_node("start")
  end

  def add_edges(event)
    node = "#{event.defined_class}##{event.method_id}".freeze

    @g.add_node(node)
    @stack << node

    edge = [@stack[-2], @stack[-1]]

    return if @edges.include?(edge)

    @edges << edge
    @g.add_edge(*@edges.last)
  end

  def output(*args)
    @g.output(*args)
  end

  def node_count
    @g.node_count
  end

  def pop
    @stack.pop
  end
end
