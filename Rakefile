require 'rubygems'
require 'bundler/gem_tasks'
require 'rake'
require 'echoe'

Echoe.new('graph_lite', '0.1.0') do |p|
  p.description    = "Ultralite wrapper for Facebook API."
  p.url            = "http://github.com/samgro/graph_lite"
  p.author         = "Sam Grossberg"
  p.email          = "sam@outdrsy.com"
  p.ignore_pattern = ["tmp/*", "script/*"]
  p.runtime_dependencies      = ['typhoeus', 'json']
  p.development_dependencies  = []
end

Dir["#{File.dirname(__FILE__)}/tasks/*.rake"].sort.each { |ext| load ext }