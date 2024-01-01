# Using the following code, add a method named #identify that returns its calling object.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def identify
    self
  end
end

kitty = Cat.new('Sophie')
p kitty.identify

=begin
Because `identify` is an instance method, `self` on line 11 refers to the calling object. 
In this case `self` refers to the `Cat` object referenced by `kitty`. 

Calling `p` on the return value of invoking `identify` on `kitty` is the same as calling `p`
on `kitty` directly because `p` automatically invokes `inspect` on its argument. As a result, 
an encoding of the object id and the values of all initialized instance variables of the object
are printed.

=end

# key point: what does `self` refers to