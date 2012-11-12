require 'rspec'
require 'rspec/mocks'
require 'aequitas'

Dir[File.expand_path('../{support,shared}/**/*.rb', __FILE__)].each { |f| require(f) }
