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

# Pizza class will create objects with the instance variable `@name`. This is because within its 
# constructor method on line 12, we are initializing the `@name` instance variable. In contrast, 
# the constructor of Fruit class is actually initializing a local variable `name` rather than 
# an instance variable. Instance variables are denoted by prepending a `@` to the variable name.

# Anotehr way to know if an object has instance variables is to invoke the `instance_variables`
# on the object, which will return an array of symbols that represent the instance variable 
# names.

hot_pizza = Pizza.new("cheese")
orange    = Fruit.new("apple")

p hot_pizza.instance_variables
p orange.instance_variables

# key point: instance variables