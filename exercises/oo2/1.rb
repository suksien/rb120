# Modify the following code so that Hello! I'm a cat! is printed when Cat.generic_greeting is invoked.

class Cat
  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end
end

Cat.generic_greeting

kitty = Cat.new
kitty.class.generic_greeting 
# allowed because #generic_greeting is invoked on the Cat class, which is the return value of #class method