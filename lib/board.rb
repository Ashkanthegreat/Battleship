class Board
  attr_reader :cells

  def initialize
    @cells = {"A1"=> Cell.new("A1"), "A2" => Cell.new("A2"),
      "A3" => Cell.new("A3"), "A4" => Cell.new("A4"),
      "B1" => Cell.new("B1"), "B2" => Cell.new("B2"),
      "B3" => Cell.new("B3"), "B4" => Cell.new("B4"),
      "C1" => Cell.new("C1"), "C2" => Cell.new("C2"),
      "C3" => Cell.new("C3"), "C4" => Cell.new("C4"),
      "D1" => Cell.new("D1"), "D2" => Cell.new("D2"),
      "D3" => Cell.new("D3"), "D4" => Cell.new("D4")}
  end

  def valid_coordinate?(coordinate)
    @cells.keys.any? { |key| key == coordinate }
  end

  def valid_placement?(ship, coordinates)
    #need to check if it overlaps
    valid_length?(ship, coordinates) && consecutive?(coordinates)
  end

  def valid_length?(ship, coordinates)
    #needs test
    ship.length == coordinates.length
  end

  def num_coord(coordinates)
    split_coordinates_by_num = coordinates.map { |coord| coord.chars }
    split_coordinates_by_num.map { |coord| coord[1].to_i }
  end

  def letter_coord(coordinates)
    split_coordinates_by_letter = coordinates.map { |coord| coord.chars }
    split_coordinates_by_letter.map { |coord| coord[0] }
  end

  def consecutive_numbers?(coordinates)
    #needs test
    letter_coord(coordinates).uniq.size == 1 &&
    num_coord(coordinates).each_cons(2).all?  { |num1,num2| num2 == (num1 + 1) }
  end

  def consecutive_letters?(coordinates)
    #needs test
    ordinal_letters = letter_coord(coordinates).map { |letter| letter.ord }
    ordinal_letters.each_cons(2).all? do  |num1,num2|
       num2 == (num1 + 1)
     end
  end

  def consec_ordinals_continued?(coordinates)
    #needs test
    num_coord(coordinates).uniq.size == 1 &&
    consecutive_letters?(coordinates)
  end

  def consecutive?(coordinates)
    #needs test
    consecutive_numbers?(coordinates) || consec_ordinals_continued?(coordinates)
  end

  def place(ship, coordinates)
    #iterate ocver board and place ship on each cell
    # cell is key coordinate is value
    #you have a method taht will help within another class
  end

end
