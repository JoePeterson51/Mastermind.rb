require 'minitest/autorun'
require 'minitest/pride'
require './lib/deck'
require './lib/game_piece'
require './lib/player'
require './lib/turn'

class PlayerTest < Minitest::Test

  def setup
    @player1 = Player.new('John')
    @player2 = Player.new('Jim')
    @game_piece1 = GamePiece.new('red')
    @game_piece2 = GamePiece.new('blue')
    @game_piece3 = GamePiece.new('green')
    @game_piece4 = GamePiece.new('yellow')
    @players = [@player1, @player2]
    @game_pieces = [@game_piece1, @game_piece2, @game_piece3, @game_piece4]
    @deck = Deck.new(@game_pieces)
    @turn = Turn.new(@players, @deck)
    assert_instance_of Turn, @turn
  end

  def test_it_has_attributes
    assert_instance_of Turn, @turn
  end

  def test_timer
    @turn.start_timer

    assert_instance_of Time, @turn.timer

    #maybe checks to see if timer ends if game is won
  end

  def test_guess_num
    assert_equal 0, @turn.guess_num

    #when guesses accumulate, adds to guess_num
  end

  def test_check_guess
    skip
    @turn.player1.players_guess_var = 'bbrr'
    @turn.deck.winning_combo = 'yggy'
    response = '\'bbrr\' has 0 of the correct elements with 0 in the correct positions. You\'ve taken 1 guess'

    assert_equal response, @turn.check_guess

    @turn.player1.players_guess_var = 'gbrr'
    response = '\'gbrr\' has 1 of the correct elements with 0 in the correct positions. You\'ve taken 2 guess'

    assert_equal response, @turn.check_guess

    @turn.player1.players_guess_var = 'bgrr'
    response = '\'bgrr\' has 1 of the correct elements with 1 in the correct positions. You\'ve taken 3 guess'

    assert_equal response, @turn.check_guess

    @turn.player1.players_guess_var = 'yggy'
    # require 'pry'; binding.pry
    response = %{Congratulations! You guessed the sequence #{@deck.winning_combo} in 8 guesses over 4 minutes,\n 22 seconds.
     \n  Do you want to (p)lay again or (q)uit?}

    assert_equal response, @turn.check_guess
  end

  def test_change_turn
    assert_equal @turn.guesser, @player1

    @turn.change_turn

    assert_equal @turn.guesser, @player2
  end
end
