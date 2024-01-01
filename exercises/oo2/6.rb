=begin

Using the following code, create a class named Cat that prints a greeting when #greet is invoked. 
The greeting should include the name and color of the cat. 
Use a constant to define the color.

=end

class Cat
  attr_accessor :name
  COLOR = "black"

  def initialize(name)
    self.name = name
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

=begin
Constant variables are defined by uppercasing the first letter of the variable name, 
although by convention the entire name is uppercased.

Constant variables have lexical scope, which means they avaiable anywhere within the 
enclosing class.
=end

# key point: constants