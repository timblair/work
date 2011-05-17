# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'work/version'

Gem::Specification.new do |s|
  s.name        = 'work'
  s.version     = Work::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Tim Blair']
  s.email       = ['tim@bla.ir']
  s.homepage    = 'https://github.com/timblair/work'
  s.summary     = 'Anti-procrastination via hosts file manipulation.'
  s.description = 'Anti-procrastination via hosts file manipulation.'

  s.rubyforge_project = 'work'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'sys-uname', '>= 0.8.5'

  s.add_development_dependency 'rspec', '>= 2.5.0'
  s.add_development_dependency 'yard', '>= 0.6.4'
end
