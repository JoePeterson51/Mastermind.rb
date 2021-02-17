require 'highline/import'

class Turn


  attr_reader :deck, :player1, :player2, :timer, :guess_num, :guesser, :winning_color_distribution, :player_guess_distribution, :game_pieces

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
    @player1 = players[0]
    @player2 = players[1]
    @deck = deck
    @timer = []
    @stop_timer = ''
    @guess_num = 0
    @guesser = player1

  end

  def stopwatch
    @timer << Time.new
    if @timer.length == 2
      @minutes = (@timer[1].to_i - @timer[0].to_i) / 60
      @seconds = (@timer[1].to_i - @timer[0].to_i) % 60
    end
  end
  def took_guess
    if @guesser == @player1
      @guess_num += 1
    end
  end
  def guess
    if @player2 == nil
      @guesser.player_guess(1)
    else
      @guesser.player_guess(2)
    end
    check_guess
  end

  def check_guess
    took_guess
    #hash winning color distribution to see how many colors right
    @winning_color_distribution = Hash.new(0)
    @player_guess_distribution = Hash.new
    @deck.winning_combo.split('').map {|e| winning_color_distribution[e] ? winning_color_distribution[e] += 1 :  winning_color_distribution[e] = 1}
    @guesser.players_guess_var.split('').map {|e| player_guess_distribution[e] ? player_guess_distribution[e] += 1 :  player_guess_distribution[e] = 1}
    spots_correct = []
    colors_correct = 0
    @winning_color_distribution.each do |key, value|
        if @player_guess_distribution[key] 
          if @player_guess_distribution[key] > value
            colors_correct += value
          elsif @player_guess_distribution[key] <= value
            colors_correct += @player_guess_distribution[key]
          end
        end
      end
    @player_guess_distribution.map {|e| e}
    @guesser.players_guess_var.split('').each_with_index {

      |element, index| 
      if element == @deck.winning_combo[index]
        spots_correct.push(true)
      end
    }
    if spots_correct.length == @deck.game_pieces.length 
      stopwatch
      return p "Congratulations! #{@guesser.name} guessed the sequence \'#{@deck.winning_combo}\' in #{@guess_num} guesses over #{@minutes} minutes,
    #{@seconds} seconds. Do you want to (p)lay again or (q)uit?"
    else
      if @player2 == nil
        p "'#{@guesser.players_guess_var}' has #{colors_correct.to_s} of the correct elements with #{spots_correct.length.to_s} in the correct positions. You\'ve taken #{@guess_num} guess"
      else
        p "#{@guesser.name} has #{colors_correct.to_s} of the correct elements with #{spots_correct.length.to_s} in the correct positions. You\'ve taken #{@guess_num} guess"
      end
      change_turn
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
