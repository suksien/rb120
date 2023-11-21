=begin

Move all of the methods from the MyCar class that also pertain to the MyTruck class 
into the Vehicle class. Make sure that all of your previous method calls are working 
when you are finished.

=end

module Chargeable
  def charging
    puts "Now charging vehicle..."
  end
end

class Vehicle
  @@total_vehicles = 0
  attr_accessor :year, :color, :model

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @speed = 0
    @@total_vehicles += 1
  end

  def self.print_total_vehicle
    puts "There are now in total #{@@total_vehicles} vehicle."
  end

  def self.gas_mileage(total_distance_traveled, total_gas_used)
    mileage = total_distance_traveled / total_gas_used
    puts "Your gas mileage is #{mileage} mpg."
  end

  def to_s
    "You are driving a #{year} #{color} #{model}."
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

class MyCar < Vehicle
  WEIGHT = 3000 # lbs
  include Chargeable
end

class MyTruck < Vehicle
  WEIGHT = 6000
end

car = MyCar.new(2023, 'silver', 'vios')
puts car
car.speed_up(20)
car.current_speed
car.spray_paint('red')
puts car

MyCar.gas_mileage(100, 10)
Vehicle.print_total_vehicle


