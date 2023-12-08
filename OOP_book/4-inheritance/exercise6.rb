=begin

Write a method called age that calls a private method to calculate the age of the vehicle. 
Make sure the private method is not available from outside of the class. 
You'll need to use Ruby's built-in Time class to help.

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

  def age
    puts "Car is #{get_age} years old!"
  end

  private
  def get_age
    this_year = Time.now.year
    this_year - year
  end
end

class MyCar < Vehicle
  WEIGHT = 3000 # lbs
  include Chargeable
end

class MyTruck < Vehicle
  WEIGHT = 6000
end

mom_car = MyCar.new(2000, 'white', 'corolla')
mom_car.age

