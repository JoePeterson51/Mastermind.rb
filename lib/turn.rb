require './lib/deck'

class Turn

  attr_reader :deck,
              :player,
              :player1,
              :player2,
              :timer,
              :stop_timer,
              :finish_time,
              :guess_num,
              :guesser

  def initialize(players, deck)
    @player = player
    # @player1 = players[0]
    # @player2 = players[1]
    @deck = deck
    @timer = ''
    @stop_timer = ''
    @guess_num = 0
    @guesser = player1
  end

  def start_timer
    @timer = Time.new
  end

  def took_guess
    if @guesser == @player1
      @guess_num += 1
    end
  end

  def check_guess
    took_guess
    colors_correct = @guesser.players_guess_var.split('').find_all {|element| deck.winning_combo.include?(element)}.count
    spots_correct = []
    @guesser.players_guess_var.split('').each_with_index {
      |element, index|
      if element == deck.winning_combo[index]
        spots_correct.push(true)
      end
    }
    if spots_correct.length == deck.game_pieces.length
      @stop_timer
      p %{Congratulations! You guessed the sequence '#{@deck.winning_combo}' in 8 guesses over 4 minutes,\n  22 seconds.
        \n Do you want to (p)lay again or (q)uit?}
    else
      p "\'#{@guesser.players_guess_var}\' has #{colors_correct.to_s} of the correct elements with #{spots_correct.length.to_s} in the correct positions. You\'ve taken #{@guess_num} guess"
    end
  end

  def change_turn
    if @guesser == player1
      @guesser = player2
    else
      @guesser = player1
    end
  end

  def end_timer
    @stop_timer = Time.new
    @stop_timer - @timer = @finish_time
  end

end
