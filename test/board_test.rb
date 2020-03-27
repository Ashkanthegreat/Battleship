require_relative 'test_helper.rb'
require './lib/cell'
require './lib/ship.rb'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @board = Board.new
    @cruiser = Ship.new("Cruiser", 3)
    @submarine = Ship.new("Submarine", 2)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_cells
    assert_equal 16, @board.cells.length
  end

  def test_cell_has_valid_coordinates
    assert_equal true, @board.valid_coordinate?("A1")
    assert_equal true, @board.valid_coordinate?("D4")
    assert_equal false, @board.valid_coordinate?("A5")
    assert_equal false, @board.valid_coordinate?("E1")
    assert_equal false, @board.valid_coordinate?("A22")
  end

  def test_valid_length
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2"])
    assert_equal false, @board.valid_placement?(@submarine, ["A2", "A3", "A4"])
  end

  def test_num_coord_returns_numbers_only
    assert_equal [2, 3, 4], @board.num_coord(["A2", "A3", "A4"])
  end

  def test_numbers_are_consecutive
  assert_equal true, @board.consecutive_numbers?(["A2", "A3", "A4"])
  assert_equal false, @board.consecutive_numbers?(["A3", "A2", "A4"])
  end

  def test_letter_coord_returns_letters_only
    assert_equal ["A", "A", "A"], @board.letter_coord(["A2", "A3", "A4"])
  end

  def test_valid_placement_consecutive
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "A2", "A4"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "C1"])
    assert_equal false, @board.valid_placement?(@cruiser, ["A3", "A2", "A1"])
    assert_equal false, @board.valid_placement?(@submarine, ["C1", "B1"])
  end

  def test_valid_placement_cant_be_diagonal
    assert_equal false, @board.valid_placement?(@cruiser, ["A1", "B2", "C3"])
    assert_equal false, @board.valid_placement?(@submarine, ["C2", "D3"])
  end

  def test_if_valid_placement_is_valid
    assert_equal true, @board.valid_placement?(@submarine, ["A1", "A2"])
    assert_equal true, @board.valid_placement?(@cruiser, ["B1", "C1", "D1"])
  end

  def test_ship_can_be_placed
    skip

  end

  def test_valid_placement_is_not_overlapping
    skip
    @board.place(@cruiser, ["A1", "A2", "A3"])
    assert_equal false, @board.valid_placement?(@submarine, ["A1", "B1"])
  end

end
