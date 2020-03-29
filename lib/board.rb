class Board
  attr_reader :cells

  def initialize
    @cells = {
 "A1" => Cell.new("A1"),
 "A2" => Cell.new("A2"),
 "A3" => Cell.new("A3"),
 "A4" => Cell.new("A4"),
 "B1" => Cell.new("B1"),
 "B2" => Cell.new("B2"),
 "B3" => Cell.new("B3"),
 "B4" => Cell.new("B4"),
 "C1" => Cell.new("C1"),
 "C2" => Cell.new("C2"),
 "C3" => Cell.new("C3"),
 "C4" => Cell.new("C4"),
 "D1" => Cell.new("D1"),
 "D2" => Cell.new("D2"),
 "D3" => Cell.new("D3"),
 "D4" => Cell.new("D4"),
}
  end

  def valid_coordinate?(coordinate)
    @cells.keys.any? { |key| key == coordinate }
  end

  def valid_placement?(ship, coordinates)
    #need to check if it overlaps, it does
    valid_length?(ship, coordinates) && consecutive?(coordinates)
  end

  def valid_length?(ship, coordinates)
    #needs test - done
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
    #needs test - done
    letter_coord(coordinates).uniq.size == 1 &&
    num_coord(coordinates).each_cons(2).all?  { |num1,num2| num2 == (num1 + 1) }
  end

  def consecutive_letters?(coordinates)
    #needs test -done
    ordinal_letters = letter_coord(coordinates).map { |letter| letter.ord }
    ordinal_letters.each_cons(2).all? do  |num1,num2|
       num2 == (num1 + 1)
     end
  end

  def consec_ordinals_continued?(coordinates)
    #needs test - done
    num_coord(coordinates).uniq.size == 1 &&
    consecutive_letters?(coordinates)
  end

  def consecutive?(coordinates)
    #needs test - done?
    consecutive_numbers?(coordinates) || consec_ordinals_continued?(coordinates)
  end

  def overlapping?(ship, coordinates)

    rows = coordinates.map do |coordinate|
      coordinate[1]


    columns = coordinate.map do |coordinate|
      coordinate[0]
      end
    end
  end

  def occupied?(ship, coordinates)
    array = []
    coordinates.each do |coordinate|
      array << @cells[coordinate].empty?
    end
    return true if array.include?(false)
    false
  end

  def place(ship, coordinates)
    valid_placement?(ship, coordinates)
    coordinates.each do |coordinate|
      @cells[coordinate].place_ship(ship)
    end
  end


  def render(reveal = false)
    a = @cells["A1"].render(reveal), @cells["A2"].render(reveal), @cells["A3"].render(reveal), @cells["A4"].render(reveal)
    b = @cells["B1"].render(reveal), @cells["B2"].render(reveal), @cells["B3"].render(reveal), @cells["B4"].render(reveal)
    c = @cells["C1"].render(reveal), @cells["C2"].render(reveal), @cells["C3"].render(reveal), @cells["C4"].render(reveal)
    d = @cells["D1"].render(reveal), @cells["D2"].render(reveal), @cells["D3"].render(reveal), @cells["D4"].render(reveal)
    rendered = "  1 2 3 4 \nA #{a.join(" ")} \nB #{b.join(" ")} \nC #{c.join(" ")} \nD #{d.join(" ")} \n"
    puts rendered
    rendered
    #need to use puts to see result
  end
end
