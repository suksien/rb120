=begin

Create a module that you can mix in to ONE of your subclasses that describes 
a behavior unique to that subclass.

=end

module Chargeable
  def charging
    puts "Now charging vehicle..."
  end
end

class Vehicle
  @@total_vehicles = 0

  def initialize(year, color, model)
    @year = year
    @color = color
    @model = model
    @@total_vehicles += 1
  end

  def self.print_total_vehicle
    puts "There are now in total #{@@total_vehicles} vehicle."
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
car.charging