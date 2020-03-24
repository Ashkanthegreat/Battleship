require_relative 'test_helper.rb'
require './lib/cell'
require './lib/ship.rb'

class CellTest < Minitest::Test

  def setup
    @cell = Cell.new("B4")
  end

  def test_it_exists
    assert_instance_of Cell, @cell
  end

  def test_ship_attributes
    assert_equal 'B4', @cell.coordinate
    assert_equal nil, @cell.ship
  end

  def test_cell_starts_empty
    assert @cell.empty?
  end

end
