require './lib/menu.rb'
require './lib/board.rb'
require './ship.rb'

class Setup
attr_reader :computer_board,
            :player_board,
            :computer_ships,
            :player_ships

def initialize
  @computer_board = Board.new
  @player_board = Board.new
  computer_ship1 = Ship.new('Cruiser')
  computer_ship2 = Ship.new('Submarine')
  player_ship1 = Ship.new('Cruiser')
  player_ship2 = Ship.new('Submarine')
  @computer_ships = [computer_ship1, computer_ship2]
  @player_ships = [player_ship1, player_ship2]
end
end
