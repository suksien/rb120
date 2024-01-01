# Update the following code so that it prints I'm Sophie! when it invokes puts kitty.

class Cat
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "I'm #{name}!"
  end
end

kitty = Cat.new('Sophie')
puts kitty

=begin
The `puts` method automatically calls the `to_s` method on its argument, i.e. line 16 is 
equivalent to `puts kitty.to_s`. To override the default `Object#to_s` method, we need to 
define a `to_s` method in the `Cat` class, which returns the desired string. 
=end

# key point: overriding default `to_s` method