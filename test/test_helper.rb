require "minitest/autorun"
require 'factory_girl'

class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

require './lib/metric'
require './lib/metrics_manager'
