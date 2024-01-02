# Given the class below, how do we create two different instances of this class 
# with separate names and ages?

# To create separate instances of a class, we need to call the `new` method on the class
# name and pass in the respective values for the the `name` and `age` parameters. The `new`
# method by default calls the `initialize` method of the respective clas.
AngryCat.new(4.5, 'Kobu')
AngryCat.new(3, 'George')

# Two instances of the class, each with its own attributes.