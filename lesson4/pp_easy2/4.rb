# What could you add to this class to simplify it and remove two methods from the class definition 
# while still maintaining the same functionality?

# one can use the `attr_accessors` method to create both setter and getter methods
class BeesWax
  attr_accessor(:type, :name)
  def initialize(type)
    @type = type
  end

  # def type
  #   @type
  # end

  # def type=(t)
  #   @type = t
  # end

  def describe_type
    puts "I am a #{type} of Bees Wax"
  end
end

=begin
The `type` method on line 6 is a getter method while `type=(t)` on line 10 is a getter method. 
Since we want both, they can be created at the same time by calling `attr_accessor`.

=end

# key point: getter and setter methods