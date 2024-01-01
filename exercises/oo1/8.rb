# Using the code from the previous exercise, add a setter method named #name=. 
# Then, rename kitty to 'Luna' and invoke #greet again.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def name=(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.name = "Luna"
kitty.greet

# key point: setter method creation

=begin
Setter methods have a special syntax where a `=` is appended to the method name. 
Another rule of setter methods is that they always return the value of the passed-in arguments, 
regardless of an explicit `return` statement or if another line is the last evaluated line.
=end