class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# `self.age += 1` is the same as `self.age = self.age + 1`. The `self.age=` is calling
# the setter method while `self.age` (to the right of =) is calling the getter method.

# we can reference and reassign the `@age` instance method directly by replacing 
# that line with `@age += 1`.

# key point: getter and setter methods vs referencing instance variables