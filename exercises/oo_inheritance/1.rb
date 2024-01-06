# Using the following code, create two classes - Truck and Car - that both inherit from Vehicle.

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
end

class Car < Vehicle
end

truck1 = Truck.new(1994)
puts truck1.year

car1 = Car.new(2006)
puts car1.year

=begin
On line 11, we create a `Truck` class that inherits from the `Vehicle` class, which means
that all methods and instance variables defined in `Vehicle`, specifically the `year` getter
and`initialize` methods and `@year` instance variable are also available to `Truck` objects. 

This is why we can invoke the `year` getter method on a `Truck` object referenced by `truck1`. 

Class inheritance can be used to produce DRYer codes whereby a superclass implements the
common behaviors of the subclasses.

=end

# key point: class inheritance