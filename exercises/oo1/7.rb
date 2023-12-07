# Using the code from the previous exercise, 
# add a getter method named #name and invoke it in place of @name in #greet.

class Cat
  def initialize(name)
    @name = name
  end

  attr_reader :name # preferred way
  # def name
  #   @name
  # end

  def greet
    puts "Hello! My name is #{name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet
p kitty.name