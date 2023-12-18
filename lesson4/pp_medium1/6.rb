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