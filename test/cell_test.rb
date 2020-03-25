require_relative 'test_helper.rb'
require './lib/cell'
require './lib/ship.rb'

class CellTest < Minitest::Test

  def setup
    @cell_1 = Cell.new("B4")
    @cell_2 = Cell.new("C3")
    @cruiser = Ship.new("Cruiser", 3)
  end

  def test_it_exists
    assert_instance_of Cell, @cell_1
  end

  def test_ship_attributes
    assert_equal 'B4', @cell_1.coordinate
    assert_equal nil, @cell_1.ship
  end

  def test_cell_starts_empty
    assert @cell_1.empty?
  end

  def test_it_can_place_ship
    @cell_1.place_ship(@cruiser)
    assert_equal @cruiser, @cell_1.ship
    assert_equal false, @cell_1.empty?
  end

  def test_knows_when_fired_upon
    @cell_1.place_ship(@cruiser)
    assert_equal false, @cell_1.fired_upon?
    @cell_1.fire_upon
    assert_equal 2, @cell_1.ship.health
    assert_equal true, @cell_1.fired_upon?
  end

  def test_render
    assert_equal '.', @cell_1.render

    @cell_1.fire_upon

    assert_equal 'M', @cell_1.render

    @cell_2.place_ship(@cruiser)

    assert_equal '.', @cell_2.render

    assert_equal 'S', @cell_2.render(true)

    @cell_2.fire_upon
    assert_equal 'H', @cell_2.render

    assert_equal false, @cruiser.sunk?
    @cruiser.hit
    @cruiser.hit
    assert_equal true, @cruiser.sunk?

    assert_equal 'X', @cell_2.render 

  end

end
