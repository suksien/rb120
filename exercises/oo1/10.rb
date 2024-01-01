=begin

Using the following code, create a module named Walkable that contains a method named #walk. 
This method should print Let's go for a walk! when invoked. 
Include Walkable in Cat and invoke #walk on kitty.

=end

module Walkable
  def walk
    puts "Let's go for a walk!"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
kitty.walk

# key point: module creation, usage, and mixing in

=begin
A module can be defined by using the `module` keyword and it can mixed in to any class
by invoking `include` and passing in the module name. After a module is mixed in, the methods
in the module can be invoked on instances of the class just like instance methods. 

=end