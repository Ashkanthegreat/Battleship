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

end
