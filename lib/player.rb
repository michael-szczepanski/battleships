class Player
  def initialize(name)
    @name = name
    @ships = []
  end

  def place_ships()
    @ships.map! do |ship_size|
      Ship.new(ship_size)
    end
  end
end