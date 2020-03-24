require_relative 'test_helper.rb'
require './lib/ship.rb'

class ShipTest < Minitest::Test

  def setup
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Ship, @cruiser
  end

  def test_test_ship_name
    assert_equal "Cruiser", @cruiser.name
  end

  def test_can_retrieve_ship_length
    assert_equal 3, @cruiser.length

  end
end
