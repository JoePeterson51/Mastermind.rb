class Deck

  attr_reader :winning_combo, :game_pieces
  def initialize(game_pieces)
     @game_pieces = game_pieces
  end

  def winning_combo
    @game_pieces = ['red', 'blue', 'yellow', 'green']
    array = Array.new(4).map {|element| p @game_pieces[rand(4)]}
  end
end
