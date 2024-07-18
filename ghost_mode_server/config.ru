require 'rubygems'
require 'geminabox'

Geminabox.data = File.join(File.dirname(__FILE__), 'data')
run Geminabox::Server
