=begin

Using the following code, determine the lookup path used when invoking cat1.color. 
Only list the classes that were checked by Ruby when searching for the #color method.

=end

class Animal
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Cat < Animal
end

class Bird < Animal
end

cat1 = Cat.new('Black')
cat1.color

# Cat, Animal

=begin
The method lookup path is the order of classes that Ruby follows when searchin for a particular
method that is invoked. It starts from the class of the calling object and goes up the 
inheritance chain until it either finds the method, in which it will stop searching, or reaches
the end of the lookup path, in which case it will throw an error if the method is not found.  

The `::ancestors` method returns an array of ordered class names in the method lookup path.
=end

