class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new # instantiating a new Oracle object

# calling the `predict_the_future` method on the object, returning a string
p oracle.predict_the_future 