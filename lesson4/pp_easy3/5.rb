class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

tv = Television.new 

# this will throw a `NoMethodError` exception as `manufacturer` is a class method, but in
# the line below, it is called on an instance of the class. 
tv.manufacturer

# this will run as expected
tv.model

# this will run as expected
Television.manufacturer

# this will throw a `NoMethodError` because we are calling the `model` instance method
# on the class
Television.model

# key point: instance vs class methods