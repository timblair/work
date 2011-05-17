# add project-relative load paths
$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

# require stuff
require 'playtime'
require 'rspec'
require 'rspec/autorun'

