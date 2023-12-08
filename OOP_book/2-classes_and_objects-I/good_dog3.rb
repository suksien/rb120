class GoodDog
  attr_accessor :name, :weight
  attr_writer :color

  def initialize(name)
    @name = name
  end

  def speak
    "#{name} says Woof!"
  end
end

sparky = GoodDog.new("Sparky")
puts sparky.name
sparky.name = "Sparta"
puts sparky.name
sparky.weight = 10
puts sparky.weight

sparky.color = 'black'

puts sparky.speak