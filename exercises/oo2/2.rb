# Using the following code, add an instance method named #rename that renames kitty when invoked.

class Cat
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def rename(name)
    # self is required so Ruby knows between initializing local variable and invoking setter method
    self.name = name # @name = name
  end


end

kitty = Cat.new('Sophie')
p kitty.name
kitty.rename('Chloe')
p kitty.name

# key point: invoking setter methods within a class