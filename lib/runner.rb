require './lib/deck'
require './lib/game_piece'
require './lib/player'
require './lib/turn'


def winning_combo
  @deck.create_winning_combo
end

@game_piece1 = GamePiece.new('red')
@game_piece2 = GamePiece.new('blue')
@game_piece3 = GamePiece.new('green')
@game_piece4 = GamePiece.new('yellow')
@player1 = Player.new('player')
@game_pieces = [@game_piece1, @game_piece2, @game_piece3, @game_piece4]
@deck = Deck.new(@game_pieces)
@turn = Turn.new(@player1, @deck)
