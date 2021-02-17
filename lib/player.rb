class Player

  attr_accessor :players_guess_var, :name
  def initialize(name)
    @name = name
  end
  def conceal_guess(mask='*')
    @players_guess_var = ask('') { |q| q.echo = mask}
  end
  
  def player_guess(players)
    if players.to_i == 2
      conceal_guess
    else
      @players_guess_var = gets.chomp
    end
    p valid_guess?(@players_guess_var)
  end 


  def valid_guess?(guess)
    colors = ['r', 'g', 'b', 'y']
    is_an_available_guess = guess.split("").map {|element| colors.include?(element) ? 1 : 0}
    sum_valid = 0
    is_an_available_guess.each {|e| sum_valid += e}
    if sum_valid == colors.length
      true
    else
      false
    end
  end
end
