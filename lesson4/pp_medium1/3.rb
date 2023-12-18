# It may not be a good idea to expose the `@quantity` variable via the instance method? 
# set the `update_quatity` method to private? 

# Answer:
# By using `attr_accessor :quantity`, allowing users of the class to directly access and 
# change `@quantity`, rather than going through the `update_quantity` method that has
# some built-in protections. 