require './lib/player.rb'

player = Player.new("Mike", 5, [4])
puts "Empty:"
puts player.draw_board

puts "\nFilled:"
player.place_ships
puts player.draw_board
puts player.ships