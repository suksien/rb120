=begin
Add a class method to your MyCar class that calculates the gas mileage 
(i.e. miles per gallon) of any car.

Override the to_s method to create a user friendly printout of your object.
=end

class MyCar
  attr_accessor :year, :color, :model

  def self.gas_mileage(total_distance_traveled, total_gas_used)
    mileage = total_distance_traveled / total_gas_used
    "Your gas mileage is #{mileage} mpg."
  end

  def to_s
    "You are driving a #{year} #{color} #{model}."
  end

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

puts MyCar.gas_mileage(351, 13)
mycar = MyCar.new(2023, 'silver', 'Toyota Vios')
puts mycar