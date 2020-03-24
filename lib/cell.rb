class Cell
  attr_reader :coordinate, :ship

  def initialize(coordinate)
    @coordinate = coordinate
    @ship = nil
    @fired_upon = false
  end

  def empty?
    @ship.nil?
  end

  def place_ship(ship)
    @ship = ship
  end

  def fired_upon?
    @fired_upon
  end

  def fire_upon
    @fired_upon = true
    @ship != nil
    @ship.hit
  end

  def render(reveal = false)
    return 'S' if reveal && !empty? && !fired_upon?
    return '.' if fired_upon? == false
    return 'H' if fired_upon? == true && !empty? && !@ship.sunk?
    return 'X' if @ship.sunk? == true 
  end

end
