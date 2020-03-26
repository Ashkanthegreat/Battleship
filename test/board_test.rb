require_relative 'test_helper.rb'
require './lib/cell'
require './lib/ship.rb'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_equal 16, @board.cells.length
  end
end
