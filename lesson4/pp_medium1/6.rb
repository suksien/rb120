# class Computer
#   attr_accessor :template

#   def create_template
#     @template = "template 14231"
#   end

#   def show_template
#     template # calling the getter method; `self` not needed for getters
#   end
# end

class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    self.template # also calling the getter method but in a more explicit way
  end
end

com = Computer.new
com.create_template
p com.show_template

# recall Ruby style guide: "Avoid self where not required."

=begin
There is no difference in how the code works and their results, the only difference is 
the syntax. 

In both `show_template` methods, we are calling the getter method `template`. The second
class is calling the getter method explicitly by prepending a `self` to the method call, 
while the first class is calling the getter method implicitly. 

While calls to setter methods need to be done explicitly, calls to getter method do not
need to be done explicitly.
=end

# key point: calling getter and setter methods