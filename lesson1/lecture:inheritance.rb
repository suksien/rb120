# Create a new class called Cat, which can do everything a dog can, except swim or fetch. Assume the methods do the exact same thing. Hint: don't just copy and paste all methods in Dog into Cat; try to come up with some class hierarchy.

class Pet
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Dog < Pet
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end

class Cat < Pet
  def speak
    "meow"
  end
end

teddy = Dog.new
# puts teddy.speak           # => "bark!"
# puts teddy.swim           # => "swimming!"

bulldog = Bulldog.new
# puts bulldog.speak
# puts bulldog.swim

kobu = Cat.new
puts kobu.speak
puts kobu.jump

=begin
A method lookup path is the order of classes in which Ruby searches for the method that is 
currently invoked. It is important because the order of the lookup determines which method ends
up being used. If there are multiple similar method names in different classes, the method 
from the earliest occuring class will be invoked.
=end

p Bulldog.ancestors