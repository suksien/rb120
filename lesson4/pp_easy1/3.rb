=begin

The `self` in `self.class` is referencing the instance object, and it's calling the `class` method 
on the instance object, which returns the class name of the object. Additionally, string interpolation
automatically calls `to_s` on `self.class`.

=end