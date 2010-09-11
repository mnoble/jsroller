Gem::Specification.new do |s|
  s.name = "jsroller"
  s.version = "0.1.0"
  
  if s.respond_to?(:required_rubygems_version=)
    s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
  end
  
  s.authors = ["Matte Noble"]
  s.email = "me@mattenoble.com"
  s.homepage = "http://github.com/mnoble/jsroller"
  s.date = "2010-09-11"
  s.description = "JSLint command line utility"
  s.summary = "JSLint command line utility"
  s.rdoc_options = ["--charset=UTF-8"]
  
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.bindir = "bin"
  s.executables = ["jsroll"]
  s.default_executable = "jsroll"
  
  s.files = [
    "README.rdoc",
    "bin/jsroll",
    "lib/jsroller.rb",
    "lib/jsroller/runner.rb",
    "scripts/jslint.js"
  ]
  
  s.test_files = [
    "spec/spec_helper.rb", 
    "spec/jsroller/runner_spec.rb"
  ]
  
  s.add_dependency('magni', '>= 0.0.1')
  s.add_development_dependency('rspec')
end