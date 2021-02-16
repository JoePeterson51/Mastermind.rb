require './lib/deck'
require './lib/game_piece'
require './lib/player'
require './lib/turn'

class Game

  def initialize(player)
    @player = player
    @guess_num = 0
  end

  def start
    p "Welcome to MASTERMIND"
    p"Would you like to (p)lay, read the (i)nstructions, or (q)uit?"

    user_input = gets.chomp
    if user_input.downcase == 'q'
    elsif user_input.downcase == 'i'
      p "The computer will generate a winning color combo and it's your job to try and crack it. The colors will consist of (r)ed, (b)lue, (y)ellow, and (g)reen. Enter only the first letter of the color in a combo (rygb) and you will recieve a response back with how many colors your  have correct, and how many are in the correct position. Keep trying to figure out the code until you finally are able to crack it. Have fun!!!"
      p "Would you like to (p)lay?"
      user_input = gets.chomp
    end
    if user_input.downcase == 'p'
      p "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue and (y)ellow. Use (q)uit at any time to end the game. What's your guess?"
      guess = gets.chomp
      guess.check_guess
    end
  end
end
