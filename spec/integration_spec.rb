require_relative '../lib/visual_call_graph'

describe VisualCallGraph do
  it "returns the correct amount of nodes" do
    expect { VisualCallGraph.trace { Foo.aaa } }
      .to output("Call graph created with a total of 4 nodes.\n")
      .to_stdout
  end
end

module Foo
  extend self

  def aaa
    bbb
    ccc
  end

  def bbb
    ccc
  end

  def ccc
  end
end
