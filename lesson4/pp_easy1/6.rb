# What is the default return value of to_s when invoked on an object? 
# Where could you go to find out if you want to be sure?

# By default, the `to_s` method returns the string representation of the called object. 
# We should look at the `to_s` method of the object's class. 


# Answer:
# The default the `Object#to_s` prints the object’s class and an encoding of the object id
# e.g. "#<Pizza:0x0000000100a79378>"
# https://ruby-doc.org/3.2.0/Object.html#method-i-to_s
