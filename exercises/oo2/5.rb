=begin

Using the following code, create a class named Cat that tracks the number of times 
a new Cat object is instantiated. 

The total number of Cat instances should be printed when ::total is invoked.

=end

class Cat
  @@n_cat = 0
  def initialize
    @@n_cat += 1
  end

  def self.total
    puts @@n_cat
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total