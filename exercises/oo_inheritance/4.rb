=begin

Given the following code, modify #start_engine in Truck by appending 'Drive fast, please!' 
to the return value of #start_engine in Vehicle. The 'fast' in 'Drive fast, please!' should be 
the value of speed.

=end

class Vehicle
  def start_engine
    'Ready to go!'
  end
end

class Truck < Vehicle
  def start_engine(speed)
    super() + " Drive #{speed}, please!"
  end
end

truck1 = Truck.new
puts truck1.start_engine('fast')

# On line 17, invoking `super` with empty parentheses since the superclass `Vehicle#start_engine`
# method does not accept any arguments.