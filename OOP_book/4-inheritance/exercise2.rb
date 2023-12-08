=begin
Add a class variable to your superclass that can keep track of the number of objects 
created that inherit from the superclass. 

Create a method to print out the value of this class variable as well.

=end

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
end

class MyTruck < Vehicle
  WEIGHT = 6000
end

car = MyCar.new(2023, 'silver', 'vios')
truck = MyTruck.new(2023, 'black', 'hilux')
Vehicle.print_total_vehicle