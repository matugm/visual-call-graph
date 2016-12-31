
Gem::Specification.new do |s|
  s.name        = 'visual_call_graph'
  s.version     = '0.3.0'
  s.date        = '2016-12-28'
  s.summary     = ""
  s.description = "Uses the TracePoint class & Graphviz to generate a visual representation of all the methods called by another method."
  s.authors     = ["Jesus Castello"]
  s.email       = 'jesus@blackbytes.info'
  s.homepage    = 'http://www.blackbytes.info'
  s.files       = Dir["lib/*.rb"]
  s.license     = 'MIT'

  s.add_runtime_dependency 'ruby-graphviz', '~> 1.2', '>= 1.2.0'
end

