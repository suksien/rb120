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
If we added `play` method inside the `Bingo` class, it will override the superclass `Game#play`
method. This is because when trying to resolve a method name, Ruby will first search the class
of the calling object before going up the inheritance chain. In this case, it will find the `play`
method in `Bingo` and stop searching. 

=end

# key point: overriding methods (also method lookup)