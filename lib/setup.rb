require './lib/menu.rb'
require './lib/board.rb'
require './lib/ship.rb'
require './lib/cell.rb'

class Setup
attr_reader :computer_board,
            :player_board,
            :computer_ships,
            :player_ships

  def initialize
    @computer_board = Board.new
    @player_board = Board.new
    computer_ship1 = Ship.new('Cruiser', 3)
    computer_ship2 = Ship.new('Submarine', 2)
    player_ship1 = Ship.new('Cruiser', 3)
    player_ship2 = Ship.new('Submarine', 2)
    @computer_ships = [computer_ship1, computer_ship2]
    @player_ships = [player_ship1, player_ship2]
  end

  def place_computer_ships
    coordinates = @computer_ships.map do |ship|
      loop do
        (ship.length).times do
          coordinates << @computer_board.cells.keys.sample
        end
        break if @computer_board.valid_placement?(ship, coordinates)
      end
      @computer_board.place(ship, coordinates)
    end

  end

end
