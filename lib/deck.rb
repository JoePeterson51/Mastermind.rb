class Deck

  attr_accessor :winning_combo, :game_pieces
  def initialize(game_pieces)
     @game_pieces = game_pieces.to_a
     @winning_combo = ''
     @create_winning_combo = create_winning_combo
  end

  def create_winning_combo
    pieces = @game_pieces.map {|piece| piece.color}
    @winning_combo = Array.new(pieces.length).map {|element| pieces[rand(pieces.length)][0]}.join("")
    return
  end
end
