# Refactor these classes so they all use a common superclass, and inherit behavior 
# as needed.

class Vehicle
  attr_reader :make, :model

  def initialize(make, model)
    @make = make
    @model = model
  end

  def to_s
    "#{make} #{model}"
  end

  def wheels
    self.class::WHEELS # returning the class-specific constant via :: operator
  end
end

class Car < Vehicle
  WHEELS = 4
end

class Motorcycle < Vehicle
  WHEELS = 2
end

class Truck < Vehicle
  WHEELS = 6
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model)
    @payload = payload
  end
end

puts Truck.new("Toyota", "Hilux", 5)
puts Motorcycle.new("Honda", "Dream")
car =  Car.new("Toyota", "Vios")
puts car.wheels
