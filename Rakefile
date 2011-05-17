require 'bundler'
Bundler::GemHelper.install_tasks

#
# Rspec
#

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
end

task :default => [:start, :spec, :stop]


#
# Yard
#

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end


#
# Misc.
#

desc "Start an irb console with PlayTime pre-loaded."
task :console do
  exec "irb -r spec/spec_helper"
end
task :c => :console
