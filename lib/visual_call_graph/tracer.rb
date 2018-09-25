
class Tracer
  def initialize(options)
    @graph = GraphManager.new(options)
    @tracer = build_tracer
  end

  def enable
    @tracer.enable
  end

  def disable
    @tracer.disable
  end

  def generate_output_png
    @graph.output(png: "#{Dir.pwd}/call_graph.png")

    puts "Call graph created with a total of #{node_count}."
  end

  private

  def build_tracer
    TracePoint.new(:call, :return) { |event|
      next if  event.defined_class == self.class

      case event.event
      when :return
        @graph.pop
      when :call
        @graph.add_edges(event)
      end
    }
  end

  def node_count
    "#{@graph.node_count} #{(@graph.node_count > 1 ? 'nodes' : 'node')}"
  end
end
