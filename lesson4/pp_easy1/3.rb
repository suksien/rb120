=begin

The `self` in `self.class` is referencing the instance object, so `self.class` is calling the 
`class` method on the instance object, which returns the class of the object. Additionally, 
string interpolation automatically calls `to_s` on `self.class` to return a string representation
of the return value.

=end