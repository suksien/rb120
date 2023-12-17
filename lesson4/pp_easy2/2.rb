class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end


trip = RoadTrip.new
p trip.predict_the_future # "You will fly to Fiji"

# The `choices` method in `Oracle` class is overriden by the `RoadTrip` class own `choices` method.
# When trying to resolve a method name (in this case `choices`), Ruby will search the method lookup 
# chain (RoadTrip -> Oracle -> Object). It finds a `choices` method in RoadTrip and stops searching
# up the inheritance hierarchy. 