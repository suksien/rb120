# Change the following code so that creating a new Truck automatically invokes #start_engine

class Vehicle
  attr_reader :year

  def initialize(year)
    @year = year
  end
end

class Truck < Vehicle
  def initialize(year)
    start_engine
    super # Invoking #super without parentheses passes all arguments to Vehicle#initialize.
  end

  def start_engine
    puts 'Ready to go!'
  end
end

truck1 = Truck.new(1994)
puts truck1.year