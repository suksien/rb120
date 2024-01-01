# Using the code from the previous exercise, replace the getter and setter methods using Ruby shorthand.

class Cat
  attr_accessor :name
  
  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = 'Luna'
kitty.greet

# key point: Ruby shorthand for creating both getter and setter methods

# the `attr_accessor` method creates both a getter and setter method with the 
# method name being the passed-in symbol. In general, the name of the getter 
# and setter methods are the same as the name of the instance variables.