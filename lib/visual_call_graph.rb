
require_relative 'graph_manager'

module VisualCallGraph
  extend self

  def trace(options = {})
    puts "Block required" and return unless block_given?

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

    puts "Call graph created with a total of #{graph.node_count} #{graph.node_count > 1 ? 'nodes' : 'node'}."
  end
end
