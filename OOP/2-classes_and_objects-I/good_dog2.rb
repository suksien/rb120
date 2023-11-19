class GoodDog
  def initialize(name)
    @name = name
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def speak
    "#{@name} says Woof!"
  end
end

sparky = GoodDog.new("Sparky")
fido = GoodDog.new("Fido")

puts fido.name
fido.name = "Fido jr"
puts fido.name