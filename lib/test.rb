require './lib/player.rb'

player = Player.new("Mike", 10, [5])
player.place_ships
puts "Board:"
puts player.draw_board
puts "Ships:"
print player.ships