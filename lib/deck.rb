class Deck

  attr_accessor :winning_combo, :game_pieces, :create_winning_combo
  def initialize(game_pieces)
     @game_pieces = game_pieces
     @winning_combo = ''
     @create_winning_combo = create_winning_combo
  end

  def create_winning_combo
    @game_pieces = ['red', 'blue', 'yellow', 'green']
    @winning_combo = Array.new(4).map {|element| p @game_pieces[rand(4)][0]}.join("")
  end
end
