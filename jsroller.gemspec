Gem::Specification.new do |s|
  s.name = "roller"
  s.version = "0.1.0"
  
  if s.respond_to?(:required_rubygems_version=)
    s.required_rubygems_version = Gem::Requirement.new(">= 0")
  end
  
  s.authors = ["Matte Noble"]
  s.email = "me@mattenoble.com"
  s.homepage = "http://mattenoble.com"
  s.date = "2010-03-25"
  s.description = "JSLint command line utility"
  s.summary = "JSLint command line utility"
  s.rdoc_options = ["--charset=UTF-8"]
  
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.bindir = "bin"
  s.executables = ["roll"]
  s.default_executable = "roll"
  
  s.files = [
    "README.rdoc",
    "bin/roll",
    "lib/roller.rb",
    "lib/roller/runner.rb",
    "scripts/jslint.js"
  ]
  
  s.test_files = [
    "spec/spec_helper.rb", 
    "spec/roller/runner_spec.rb"
  ]
  
  s.add_dependency('magni', '>= 0.0.1')
  s.add_development_dependency('rspec')
end