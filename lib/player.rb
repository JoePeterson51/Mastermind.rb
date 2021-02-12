class Player

  attr_accessor :players_guess_var
  def initialize(name)
    @name = name
  end

  def player_guess
    @players_guess_var = gets.chomp
  end 


  def valid_guess?
    input.split("").map {|element| colors.include?(element)}
  end
end
