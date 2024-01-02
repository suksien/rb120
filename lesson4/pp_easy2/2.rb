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
# chain (RoadTrip -> Oracle -> Object), which always start from the class of the object.
# It finds a `choices` method in RoadTrip and stops searching up the inheritance hierarchy. 

=begin
LS:

Since we are calling `predict_the_future` on an instance of `RoadTrip`, every time Ruby tries
to resolve a method name, it will start with the methods defined in the class of the object before
going up the inheritance chain. Eveo though the call to `choices` happen within the superclass
`Oracle`, Ruby will first look for a method named `choices` in `RoadTrip`. If it does not find 
the method in `RoadTrip`, it will invoke the `Oracle#choices` method. 

=end

# key point: method lookup