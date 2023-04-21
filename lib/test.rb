require './lib/player.rb'

player_1 = Player.new("Mike", 7, [2])
player_2 = Player.new("Steve", 7, [2])
player_1.place_ships
player_2.place_ships
position_1 = [4, "b"]
position_2 = [2, "b"]
position_3 = [2, "c"]
player_1.shoot_at(player_2, position_1)
player_1.shoot_at(player_2, position_2)
player_1.shoot_at(player_2, position_3)

puts player_1.draw_board
puts player_1.draw_shot_history(player_2)