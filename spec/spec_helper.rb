require 'rspec'
require "nokogiri"
require 'gassy'

RSpec.configure do |config|
  config.color_enabled = true
  config.formatter     = 'documentation'
end