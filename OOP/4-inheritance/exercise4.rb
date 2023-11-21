=begin
Print to the screen your method lookup for the classes that you have created.
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

puts "---Vehicle ancestors---"
puts Vehicle.ancestors


puts "---MyCar ancestors---"
puts MyCar.ancestors 
# Module first, then superclass...

puts "---MyTruck ancestors---"
puts MyTruck.ancestors
