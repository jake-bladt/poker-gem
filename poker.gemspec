Gem::Specification.new do |s|
  s.name        = "poker lib"
  s.version     = "0.0.1"
  s.summary     = "A gem for handling basic poker concepts."
  s.description = "A gem for handling basic poker concepts."
  s.authors     = ["Jake Bladt"]
  s.email       = "jake@jakebladt.com"
  s.homepage    = "http://www.jakebladt.codes"  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
  
  # Need these two gems to test client integration with rails
  s.add_development_dependency('rspec', '~> 2.7.0')
  s.add_development_dependency('debugger', '1.6.0')
end
