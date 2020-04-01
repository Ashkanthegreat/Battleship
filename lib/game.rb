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
    @player_board = @setup.player_board
    @computer_board = @setup.computer_board
  end

  def start
    @menu.start
    if @menu.user_decision == "p"
      play_game()
    end
  end

  def display_boards
      p "*********COMPUTER BOARD*********"
     @computer_board.render
     p "**********PLAYER BOARD**********"
     @player_board.render(true)
  end

  def player_shot
    display_boards
    p "Enter the coordinate for your shot:"
    @shot = gets.chomp.upcase
    until @setup.computer_board.cells.include?(@shot) && !@all_player_shots.include?(@shot)
      if !@setup.computer_board.cells.include?(@shot)
        p "Please enter a valid coordinate"
      else
        p 'You already shot there'
      end
      @shot = gets.chomp.upcase
    end
    @all_player_shots << @shot
    @setup.computer_board.cells["#{@shot}"].fire_upon
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

  def return_player_shot_result
    if @setup.computer_board.cells["#{@shot}"].render == "M"
      puts "Your shot on #{@shot} was a miss"
    elsif @setup.computer_board.cells["#{@shot}"].render == "H"
      puts "Your shot on #{@shot} was a hit"
    elsif @setup.computer_board.cells["#{@shot}"].render == "X"
      puts "Your shot on #{@shot} sunk a ship"
    end
  end

  def return_comp_shot_result
    if @setup.player_board.cells[@computer_shot[0]].render == "M"
      puts "My shot on #{@computer_shot[0]} was a miss"
    elsif @setup.player_board.cells[@computer_shot[0]].render == "H"
      puts "My shot on #{@computer_shot[0]} was a hit"
    elsif @setup.player_board.cells[@computer_shot[0]].render == "X"
      puts "My shot on #{@computer_shot[0]} sunk a ship"
    end
  end

  def take_turn
    player_shot
    computer_shot
    puts `clear`
  end


  def computer_wins
    @player_ships.all? {|ship| ship.sunk?}
  end

  def player_wins
    @computer_ships.all? {|ship| ship.sunk?}
  end




end
