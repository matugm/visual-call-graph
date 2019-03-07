
require 'graphviz'

class GraphManager
  def initialize(options)
    @stack   = ["start"]
    @edges   = []
    @options = options

    @g = GraphViz.new(:G, :type => :digraph)

    @g.add_node("start")
  end

  def add_edges(event)
    node = get_node_name(event)
    edge = [@stack.last, node]

    @stack << node

    return if @edges.include?(edge)

    @edges << edge
    @g.add_edge(*@edges.last)
  end

  def get_node_name(event)
    if @options[:show_path]
      "#{event.defined_class}##{event.method_id}\n#{event.path}".freeze
    else
      "#{event.defined_class}##{event.method_id}".freeze
    end
  end

  def output()
    format = options[:format] || :png
    path   = options[:path] || "#{Dir.pwd}/call_graph.#{format.to_s}"
    @g.output(format.to_sym => path)
  end

  def node_count
    @g.node_count
  end

  def pop
    @stack.pop
  end
end
