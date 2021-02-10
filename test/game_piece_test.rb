require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
class GamePieceTest < Minitest::Test

  def test_it_exists
    game_piece = GamePiece.new("blue")

    assert_instance_of GamePiece, card
  end
end
