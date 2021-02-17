require './lib/deck'
require './lib/game_piece'
require './lib/player'
require './lib/turn'
require 'highline/import'


class Mastermind_Runner
  attr_reader :turn, :deck
  def initialize
    @players = ''
    @playerName1 = ''
    @playerName2 = ''
    @deck = ''
    @turn = nil
    @play = false
    @winner == false
    @difficulty_level = ''
  end

  def run_game
    @winner = false
    players_setup
    difficulty_level_set
    create_winning_hand
    p     "I have generated a #{@difficulty_level} sequence with four elements made up of: (r)ed,
    (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game.
    What's your guess?"
    game_loop
    input = gets.chomp
    if input == 'p'
      start_game
    elsif input == 'q'
      return
    end
  end
  def start_game
    p %{Welcome to MASTERMIND
  
      Would you like to (p)lay, read the (i)nstructions, or (q)uit?}
    @option = gets
    @option = @option.chomp.downcase
    @play = false
    while @play == false
      if @option == 'p'
        run_game
        @play = true
      elsif @option == 'q'
        return
      elsif @option == 'i'
      else 
        p "please select either (p)lay (i)nformation or (q)uit."
        @option = gets
        @option = @option.chomp.downcase
      end
    end
  end

  def players_setup
    if !! @turn
      @turn = nil
    end
    advance = false
    p "How Many Players, 1 or 2?"
    players = gets.chomp
    while advance == false
      if players == '1'
        p "What is your name?"
        @playerName1 = Player.new(gets.chomp)
        advance = true
      elsif players == '2'
        p "Player 1's Name?"
        @playerName1 = Player.new(gets.chomp)
        p "Player 2's Name?"
        @playerName2 = Player.new(gets.chomp)
        advance = true
      else
        p 'Please select 1, 2, or (q)uit'
        players = gets.chomp
      end
      
    end
  end

  def difficulty_level_set
    p "What difficulty level, (B)eginner (I)ntermediate or (A)dvanced?"
    @difficulty_level = gets.chomp
    play = false
    while play == false
      if @difficulty_level == 'a'
        @difficulty_level = 'advanced'
        colors = ['red', 'blue', 'yellow', 'green', 'orange', 'purple']
        play = true
      elsif @difficulty_level == 'i'
        colors = ['red', 'blue', 'yellow', 'green', 'orange']
        play = true
        @difficulty_level = 'intermediate'
      elsif @difficulty_level == 'b'
        colors = ['red', 'blue', 'yellow', 'green']
        play = true
        @difficulty_level = 'beginner'
      else
        p "please select either (B)eginner (I)ntermediate or (A)dvanced."
        @difficulty_level = gets.chomp
      end
      if 
        play == true
        pieces = colors.map {|color| color = GamePiece.new(color)}
        @deck = Deck.new(pieces)
      end
    end
  end

  def create_winning_hand
    players = [@playerName1, @playerName2]
    @turn = Turn.new(players,@deck)
    @turn.deck.create_winning_combo
  end

  def game_loop
    @turn.stopwatch
    @turn.guess
    @winner = false
    while @winner == false
      @turn.guess
      if @turn.guesser.players_guess_var == @deck.winning_combo
        @winner = true
      end
    end
  end
end
mastermind = Mastermind_Runner.new
require 'pry'; binding.pry
mastermind.start_game



def winning_combo
  @deck.create_winning_combo
end

@game_piece1 = GamePiece.new('red')
@game_piece2 = GamePiece.new('blue')
@game_piece3 = GamePiece.new('green')
@game_piece4 = GamePiece.new('yellow')
@player = Player.new('player')
@game_pieces = [@game_piece1, @game_piece2, @game_piece3, @game_piece4]
@deck = Deck.new(@game_pieces)
@turn = Turn.new(@player1, @deck)
new_game.start 

