require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_piece'
require './lib/deck'
class DeckTest < Minitest::Test

  def setup
    @game_piece1 = GamePiece.new('red')
    @game_piece2 = GamePiece.new('blue')
    @game_piece3 = GamePiece.new('green')
    @game_piece4 = GamePiece.new('yellow')

    @game_pieces = [@game_piece1, @game_piece2, @game_piece3, @game_piece4]
    @deck = Deck.new(@game_pieces)
  end

  def test_it_exists

    assert_instance_of Deck, @deck
  end

  def test_it_has_attributes

    assert_equal @game_pieces[0].color, 'red'
  end

  def test_it_has_pieces

    assert_equal [@game_piece1, @game_piece2, @game_piece3, @game_piece4], @deck.game_pieces
  end

  def test_it_can_create_winning_combo
    game_piece1 = GamePiece.new()
    game_piece2 = GamePiece.new()
    game_piece3 = GamePiece.new()
    game_piece4 = GamePiece.new()
    game_pieces = [game_piece1, game_piece2, game_piece3, game_piece4]
    deck = Deck.new(game_pieces)
# require 'pry'; binding.pry
    assert_equal game_pieces = [game_piece1, game_piece2, game_piece3, game_piece4], deck.winning_combo
  end
end
