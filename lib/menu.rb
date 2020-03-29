class Menu
  attr_reader :user_decision
  def start
    puts "Welcome to BATTLESHIP"
    puts "Enter p to play. Enter q to quit."
    @user_decision = gets.chomp.downcase
    if @user_decision == "q"
      puts "You hate to see it. -Tim"
    elsif @user_decision == "p"
      puts "You love to see it. -Tim"
    elsif @user_decision != "p" || @user_decision != "q"
      puts "Invalid Answer! Say more -Megan"
      
    end
  end
end
