class Television
  def self.manufacturer
    # method logic
  end

  def model
    # method logic
  end
end

# `self.manufacturer` is a class method because the method name is prefixed with `self`, where
# here `self` refers to the Class. To call a class method, you have to call it on the class 
# directly, i.e. `Television.manufacturer`