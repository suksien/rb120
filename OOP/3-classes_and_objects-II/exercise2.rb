# When running the following code..

class Person
  attr_reader :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"

# We get the following error...
# test.rb:9:in `<main>': undefined method `name=' for
#   #<Person:0x007fef41838a28 @name="Steve"> (NoMethodError)

# Why do we get this error and how do we fix it?

=begin
The error is because on line 6 we are attempting to call the `name=` setter method, 
whereas on line 4 we have only created a getter method using the `attr_reader` method. 
To rectify, either change `attr_reader` to `attr_writer` or `attr_accessor`.
=end