class Player

  def initialize(name)
    @name = name
  end

  def player_guess
  end 


  def valid_guess?
    gets.split("").map {|element| colors.include?(element)}
  end
end
