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

  def test_for_ship_attributes
    assert_equal 3, @cruiser.length
    assert_equal 3, @cruiser.health
  end

  def test_if_cruiser_is_sunk
    assert_equal false, @cruiser.sunk?
  end

  def test_if_cruiser_takes_hits_and_sinks
    @cruiser.hit
    assert_equal 2, @cruiser.health
    @cruiser.hit
    assert_equal 1, @cruiser.health
    assert_equal false, @cruiser.sunk?
  end
end
