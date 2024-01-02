# How could we go about changing the to_s output on this method to look like this: 
# I am a tabby cat? (this is assuming that "tabby" is the type we passed in 
# during initialization).

class Cat
  def initialize(type)
    @type = type
  end

	def to_s
		"I am a #{@type} cat"
	end
end

# We need to override the default `Object#to_s` method by defining a custom `to_s` method in 
# the class definition. 

# key point: overriding `to_s`