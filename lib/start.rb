require './lib/menu.rb'
require './lib/setup.rb'
require './lib/ship.rb'
require './lib/board.rb'

class Game

  def initialize
    @menu = Menu.new
    @setup = Setup.new
    @all_player_shots = []
    @all_computer_shots = []
    @computer_ships = @setup.computer_ships
    @player_ships = @setup.player_ships
    @user_decision = @menu.user_decision
  end

  def start
  @menu.start
  if @menu.user_decision == "p"
    play_game()
  end

  def display_boards
      p "*********COMPUTER BOARD*********"
     @setup.computer_board.render
     p "**********PLAYER BOARD**********"
     @setup.player_board.render(true)
  end

end
