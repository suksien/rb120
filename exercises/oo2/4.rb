=begin

Using the following code, add two methods: ::generic_greeting and #personal_greeting. 

The first method should be a class method and print a greeting that's generic to the class. 
The second method should be an instance method and print a greeting that's custom to the object.

=end

class Cat
  attr_reader :name

  def self.generic_greeting
    puts "Hello, I'm a cat!"
  end

  def initialize(name)
    @name = name
  end

  def personal_greeting
    puts "My name is #{name}."
  end
end

kitty = Cat.new('Sophie')

Cat.generic_greeting
kitty.personal_greeting

# key point: usage of class vs instance method