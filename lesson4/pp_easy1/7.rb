=begin
`self` refers to the current `Cat` object that the `make_one_year_older` method is being invoked 
on (aka the calling object). 

This is because `self` is used in an instance method. 

Additionally, `self.age` is actually an explicit call to the `age` setter method, which is 
required for Ruby to distinguish between calling a setter method and assigning a local variable. 
=end

# key point: what is `self`