# Which of these two classes would create objects that would have an instance variable and 
# how do you know?

class Fruit
  def initialize(name)
    name = name
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

# Pizza class will create objects with instance variables `@name`. This is because its 
# constructor method is initializing the `@name` instance variable. In contrast, the constructor
# of Fruit class is actually initializing a local variable `name` rather than an instance variable. 

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables