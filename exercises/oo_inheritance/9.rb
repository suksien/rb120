=begin

Using the following code, determine the lookup path used when invoking bird1.color. 
Only list the classes or modules that were checked by Ruby when searching for the #color method.

=end

module Flyable
  def fly
    "I'm flying!"
  end
end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
  include Flyable
end

bird1 = Bird.new('Red')
bird1.color

# Bird, Flyable, Animal, Object, Kernel, BasicObject

=begin
Ruby first searches the class of the calling object, followed by any modules that are mixed
in to the class, and finally it searches the superclass. When traversing through modules, Ruby
  searches the last `included` module first. 
=end