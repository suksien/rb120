=begin

Using the code from the previous exercise, add an #initialize method that prints I'm a cat! 
when a new Cat object is instantiated.

=end

class Cat
  def initialize
    puts "I'm a cat!"
  end
end

kitty = Cat.new

# key point: the `#initialize` method

=begin
The `initialize` method is known as a constructor, which creates a new object for the class.
It is automatically invoked when we call the `::new` method on the class. 
=end