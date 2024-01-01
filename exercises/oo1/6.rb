=begin

Using the code from the previous exercise, move the greeting from the #initialize method 
to an instance method named #greet that prints a greeting when invoked.
=end

class Cat
  def initialize(name)
    @name = name
  end
  
  def greet
    puts "Hello! My name is #{@name}!"
  end
end

kitty = Cat.new('Sophie')
kitty.greet

# key point: instance method definition and invocation, scope of instance variales

=begin
On line 17, we instantiate a new `Cat` object by calling the `::new` method on the `Cat` 
class, which in turn calls the `initialize` method and forwards the passed-in string argument. 
The new `Cat` object is assigned to the `kitty` local variable. 

On line 18, we invoke the instance method `#greet` on the `Cat` object, which prints (...)

The instance method `#greet` can access the `@name` instance variable even though
it is initialized outside of the `#greet` method. This is because instance methods are
invoked on objects and instance variables are scoped at the object level.
=end