
require 'visual_call_graph/graph_manager'
require 'visual_call_graph/tracer'

module VisualCallGraph
  extend self

  def trace(options = {})
    unless block_given?
      puts "Block required!"
      return
    end

    tracer = Tracer.new(options)

    tracer.enable
    yield
    tracer.disable

    tracer.generate_output_png
  end
end
