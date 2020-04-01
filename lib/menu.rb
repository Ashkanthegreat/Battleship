class Menu
  attr_reader :user_decision

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    @user_decision = gets.chomp.downcase
    menu_response(user_decision)
  end

  def menu_response(user_decision)
    if user_decision == "q"
    elsif user_decision == "p"
      p "You love to see it. -Tim"
    elsif user_decision != "p" || user_decision != "q"
      p "Invalid Answer! Say more -Megan"
    end
  end
end
