# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{graph_lite}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = [%q{Sam Grossberg}]
  s.date = %q{2011-06-17}
  s.description = %q{Ultralite wrapper for Facebook API.}
  s.email = %q{sam@outdrsy.com}
  s.extra_rdoc_files = [%q{README.rdoc}, %q{lib/graph_lite.rb}]
  s.files = [%q{README.rdoc}, %q{Rakefile}, %q{lib/graph_lite.rb}, %q{Manifest}, %q{graph_lite.gemspec}]
  s.homepage = %q{http://github.com/samgro/graph_lite}
  s.rdoc_options = [%q{--line-numbers}, %q{--inline-source}, %q{--title}, %q{Graph_lite}, %q{--main}, %q{README.rdoc}]
  s.require_paths = [%q{lib}]
  s.rubyforge_project = %q{graph_lite}
  s.rubygems_version = %q{1.8.5}
  s.summary = %q{Ultralite wrapper for Facebook API.}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
