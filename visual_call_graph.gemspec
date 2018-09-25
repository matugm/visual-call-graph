
Gem::Specification.new do |s|
  s.name        = 'visual_call_graph'
  s.version     = '0.5.0'
  s.summary     = "This gem helps you see all the other methods called by another method."
  s.description = "Uses the TracePoint class & Graphviz to generate a visual representation of all the methods called by another method."
  s.authors     = ["Jesus Castello"]
  s.email       = 'jesus@rubyguides.com'
  s.homepage    = 'https://www.rubyguides.com'
  s.files       = Dir["lib/*.rb"]
  s.license     = 'MIT'

  s.require_paths = ["lib"]

  s.add_runtime_dependency 'ruby-graphviz', '~> 1.2.0'
end

