require 'rspec'
require 'rack/dustbin_lorry'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.formatter = :documentation
end
