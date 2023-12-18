# How could you change the method name below so that the method name is 
# more clear and less repetitive?

class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  #def light_status
  def to_s
    "I have a brightness level of #{brightness} and a color of #{color}"
  end

end

# change the `light_status` name to `to_s`, which will be called automatically whenever we
# invoke `puts` on a `Light` object. 
light = Light.new(10, 'green')
puts light