=begin
Create a superclass called Vehicle for your MyCar class to inherit from and 
move the behavior that isn't specific to the MyCar class to the superclass. 

Create a constant in your MyCar class that stores information about the vehicle 
that makes it different from other types of Vehicles.

Then create a new class called MyTruck that inherits from your superclass that 
also has a constant defined that separates it from the MyCar class in some way.
=end

class Vehicle
  attr_accessor :year, :color, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(num)
    @speed += num
  end

  def brake(num)
    @speed -= num
  end

  def shutdown
    @speed = 0
  end

  def current_speed
    puts "Current speed is #{@speed}"
  end

  def spray_paint(color)
    self.color = color
  end

  def to_s
    "You are driving a #{year} #{color} #{model}."
  end
end

class MyCar < Vehicle
  WEIGHT = 3000 # lbs
end

class MyTruck < Vehicle
  WEIGHT = 6000
end

car = MyCar.new(2023, 'silver', 'vios')
puts car # implicitly calling subclass to_s method
car.speed_up(20)
car.current_speed

truck = MyTruck.new(2023, 'black', 'hilux')
puts truck
truck.speed_up(50)
truck.current_speed