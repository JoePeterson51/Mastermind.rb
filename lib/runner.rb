require './lib/deck'
require './lib/game_piece'
require './lib/player'
require './lib/turn'
require './lib/game'



game_piece1 = GamePiece.new('red')
game_piece2 = GamePiece.new('blue')
game_piece3 = GamePiece.new('green')
game_piece4 = GamePiece.new('yellow')
player = Player.new('player')
game_pieces = [game_piece1, game_piece2, game_piece3, game_piece4]
deck = Deck.new(game_pieces)
new_game = Game.new(player)
turn = Turn.new(player, deck)
new_game.start
