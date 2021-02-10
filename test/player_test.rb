require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/game_piece'
require './lib/player'
class PlayerTest < Minitest::Test

  def test_it_has_attributes
    player = Player.new('John')

    assert_instance_of Player, player
  end

  def test_it_has_valid_arguments
    valid_colors = ['r', 'b', 'g', 'y']
    player = Player.new('John')

    assert_equal valid_colors.include?, player.player_guess.split('')
  end
end
