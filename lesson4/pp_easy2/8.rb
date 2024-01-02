class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

=begin
In order for `Bingo` class to inherit the `Game#play` method, we need to inherit it from 
the `Game` class. 
=end

# key point: class inheritance