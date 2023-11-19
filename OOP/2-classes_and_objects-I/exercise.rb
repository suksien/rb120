=begin
Create a class called MyCar. When you initialize a new instance or object of the class, 
allow the user to define some instance variables that tell us the year, color, and 
model of the car. 

Create an instance variable that is set to 0 during instantiation of the object to 
track the current speed of the car as well. 

Create instance methods that allow the car to speed up, brake, and shut the car off.
=end

class MyCar
  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(mph)
    @speed = mph
  end

  def brake(mph)
    @speed = mph
  end

  def power_off
    @speed = 0
  end

  def current_speed
    puts "Current speed of your #{@year} #{@color} #{@model} is #{@speed} mph."
  end
end

car = MyCar.new(2023, 'silver', 'Toyota Vios')
p car
car.speed_up(50)
car.current_speed

car.brake(20)
car.current_speed

car.power_off
puts car.current_speed