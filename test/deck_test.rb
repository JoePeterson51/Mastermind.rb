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

    require 'pry'; binding.pry
    assert_equal [@game_piece1, @game_piece2, @game_piece3, @game_piece4], @deck.game_pieces
  end
  def test_winning_combo_is_valid
    valid_colors = ['r', 'b', 'g', 'y']
    @deck.create_winning_combo
    assert @deck.winning_combo.split('').map {|element| valid_colors.include?(element)}
  end
end
