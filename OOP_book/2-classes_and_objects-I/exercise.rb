=begin
Create a class called MyCar. When you initialize a new instance or object of the class, allow the user to define some instance variables that tell us the year, color, and model of the car. 

Create an instance variable that is set to 0 during instantiation of the object to track the current speed of the car as well. 

Create instance methods that allow the car to speed up, brake, and shut the car off.

Add an accessor method to your MyCar class to change and view the color of your car. Then add an accessor method that allows you to view, but not modify, the year of your car.

You want to create a nice interface that allows you to accurately describe the action you want your program to perform. Create a method called spray_paint that can be called on an object and will modify the color of the car.
=end

class MyCar
  attr_accessor :color
  attr_reader :year
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
end

mycar = MyCar.new(2023, 'silver', 'Toyota Vios')
# mycar.speed_up(30)
# mycar.current_speed
# mycar.brake(10)
# mycar.current_speed
# mycar.shutdown
# mycar.current_speed
# puts mycar.color
# puts mycar.color = "black"
# puts mycar.color
# puts mycar.year
mycar.spray_paint('white')
puts mycar.color