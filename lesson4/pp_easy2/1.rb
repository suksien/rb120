class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new # instantiating a new Oracle object

# calling the `predict_the_future` method on the newly created object referenced by `oracle`
# the method call will return a string of the form `"You will <something>"`
p oracle.predict_the_future 