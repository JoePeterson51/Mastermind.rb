class Deck

  attr_accessor :winning_combo, :game_pieces
  def initialize(game_pieces)
     @game_pieces = game_pieces.to_a
     @winning_combo = ''
  end

  def create_winning_combo
    @game_pieces = @game_pieces.map {|piece| piece.color}
    @winning_combo = Array.new(@game_pieces.length).map {|element| @game_pieces[rand(@game_pieces.length)][0]}.join("")
    return
  end
  
end
