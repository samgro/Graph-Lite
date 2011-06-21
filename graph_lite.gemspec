# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "graph_lite/version"

Gem::Specification.new do |s|
  s.name        = "graph_lite"
  s.version     = GraphLite::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sam Grossberg","Julian Tescher"]
  s.email       = ["sam.grossberg@gmail.com","jatescher@gmail.com"]
  s.homepage    = "https://github.com/samgro/Graph-Lite"
  s.summary     = "A light-weight Facebook API Gem"
  s.description = "A light-weight Facebook API Gem, written in Ruby"

  s.rubyforge_project = "graph_lite"
  
  s.required_rubygems_version = ">= 1.3.6"
  s.add_dependency("typhoeus", "~>0.2.4")
  s.add_dependency("json", "~>1.5.3")
  s.add_dependency("activesupport", "~>3.0.9")
  
  s.add_development_dependency("rspec", "~> 2.0.1")
  s.add_development_dependency("bundler", ">= 1.0.0")

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
