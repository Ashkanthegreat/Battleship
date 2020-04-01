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

  def player_shot
    display_boards
    p "Enter the coordinate for your shot:"
    @guess = gets.chomp.upcase
    until @setup.computer_board.cells.include?(@guess) && !@all_player_shots.include?(@guess)
      if !@setup.computer_board.cells.include?(@guess)
        p "Please enter a valid coordinate"
      else
        p 'You already shot there'
      end
      @guess = gets.chomp.upcase
    end
    @all_player_shots << @guess
    @setup.computer_board.cells["#{@guess}"].fire_upon
    return_player_shot_result
  end

  def computer_shot
   @computer_shot = @setup.computer_board.cells.keys.sample(1)
   if @all_computer_shots.include?(@computer_shot)
     @computer_shot = @setup.computer_board.cells.keys.sample(1)
   end

   @setup.player_board.cells[@computer_shot[0]].fire_upon
    @all_computer_shots << @computer_shot
    return_comp_shot_result
  end

end
