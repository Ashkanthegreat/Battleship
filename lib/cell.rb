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
    if @ship != nil
      @ship.hit
    end
    @fired_upon = true
  end

  def render(reveal = false)
    return 'S' if reveal = true && !empty? && !fired_upon?
    return '.' if fired_upon? == false
    return "M" if fired_upon? == true && empty?
    return 'H' if fired_upon? == true && !empty? && !@ship.sunk?
    return 'X' if @ship.sunk? == true && @ship.health < 1
  end

end
