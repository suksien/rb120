# sharing one copy of class variables

class Vehicle
  @@wheels = 0

  def self.wheels
    @@wheels
  end
end

p Vehicle.wheels # => 0

class Motorcycle < Vehicle
  @@wheels = 2
end

p Vehicle.wheels    # => 2
p Motorcycle.wheels # => 2

class Car < Vehicle
  @@wheels = 4
end

p Motorcycle.wheels # => 4
p Vehicle.wheels    # => 4
p Car.wheels        # => 4
