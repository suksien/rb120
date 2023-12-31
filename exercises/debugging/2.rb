class Animal
  def initialize(diet, superpower)
    @diet = diet
    @superpower = superpower
  end

  def move
    puts "I'm moving!"
  end

  def superpower
    puts "I can #{@superpower}!"
  end
end

class Fish < Animal
  def move
    puts "I'm swimming!"
  end
end

class Bird < Animal
end

class FlightlessBird < Bird
  # def initialize(diet, superpower)
  #   super
  # end

  def move
    puts "I'm running!"
  end
end

class SongBird < Bird
  def initialize(diet, superpower, song)
    super(diet, superpower) # super
    @song = song
  end

  def move
    puts "I'm flying!"
  end
end

# Examples

unicornfish = Fish.new(:herbivore, 'breathe underwater')
penguin = FlightlessBird.new(:carnivore, 'drink sea water')
robin = SongBird.new(:omnivore, 'sing', 'chirp chirrr chirp chirp chirrrr')

=begin
Line 50 raises an `ArgumentError`. This is because the `super` keyword on line 37
of the `initialize` method is passing all 3 arguments to the superclass `Animal#initialize` 
method, which only accepts 2 arguments, as defined on line 2. 

To fix, we can change line 37 to `super(diet, superpower)` which will now correctly pass only 
2 arguments to the superclass `initialize` method. 


FE:
The `initialize` method of the `FlightlessBird` class is unnecessary. This is because
it is invoking the superclass `initialize` method after overriding it. However, in the future, 
one may consider to add more states to the class that are not present in the superclass. 
In such cases, a custom `initialize` method that overrides the superclass' method will be needed. 
=end