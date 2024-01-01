# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting 
# is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting 
# allowed because #generic_greeting is invoked on the Cat class, which is the return value 
# of #class method

=begin
Class methods are defined by prepending `self.` to the method name. Here `self` refers to the
class, hence class methods can also defined by prepending the class name directly, i.e., 
`Cat.generic_greeting`. However, using `self` is preferred for maintainability in case one
decides to change the class name in the future. 

=end

# key point: class method definition and usage