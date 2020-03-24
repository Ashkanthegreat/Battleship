require_relative 'test_helper.rb'
require './lib/ship.rb'

class ShipTest < Minitest::Test

  def setup
    @ship = Ship.new("Cruiser", 3)
  end
end
