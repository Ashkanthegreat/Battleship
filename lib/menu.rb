class Menu
  attr_reader :user_decision

  def start
    p "Welcome to BATTLESHIP"
    p "Enter p to play. Enter q to quit."
    user_decision = gets.chomp.downcase
    menu_response(user_decision)
  end

  def menu_response(user_response)
    if user_response == "q"
      p "You hate to see it. -Tim"
    elsif user_response == "p"
      p "You love to see it. -Tim"
    elsif user_response != "p" || user_response != "q"
      p "Invalid Answer! Say more -Megan"
    end
  end
end
