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

  
