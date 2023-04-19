## Describe
```
As a player
So that I can prepare for the game
I would like to place a ship in a board location

As a player
So that I can play a more interesting game
I would like to have a range of ship sizes to choose from

As a player
So the game is more fun to play
I would like a nice command line interface that lets me enter ship positions and
shots using commands (rather than using IRB to interact with objects)

As a player
So that I can create a layout of ships to outwit my opponent
I would like to be able to choose the directions my ships face in

As a player
So that I can have a coherent game
I would like ships to be constrained to be on the board

As a player
So that I can have a coherent game
I would like ships to be constrained not to overlap

As a player
So that I can win the game
I would like to be able to fire at my opponent's board

As a player
So that I can refine my strategy
I would like to know when I have sunk an opponent's ship

As a player
So that I know when to finish playing
I would like to know when I have won or lost

As a player
So that I can consider my next shot
I would like to be able to see my hits and misses so far

As a player
So that I can play against a human opponent
I would like to play a two-player game
```

## Design
```
Game class:
@players: [Player]
@players_lost = [Player]
@ship_sizes: [Integers]
@turn_count: Integer

def setup:
# creates player objects

def game_won?
# checks if only one player left with ships
# returns that player
```
```
Ship class:
@size: int
@position: int
@direction: boolean
@sunk: boolean
@hit_points: boolean

def sunk?
# checks if ship has lost all hit points
# updates @sunk
```
```
Player class:
@ships: [Ship]
@board: [[hit/miss/sunk],[]]
@shot_history: {:player => Player, :position => [[x,y]]}
@name: String

def place_ship(position)
# creates ship objects
# adds them to @ships

def fire(Player, position)
# checks if the position has already been chosen before
# returns result (hit/miss/sunk) to player
```
```
Interface class:
@game: Game class object

def place_ships
# has all players fill up their boards with sizes given by game
# returns nothing

def game_loop
# core loop of asking players one by one for their command:
  (shot history, make move)
# returns feedback based on player move
# checks if game has finished after every move
```
## Examples