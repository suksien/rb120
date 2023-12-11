=begin

Update this code so that when you run it, you see the following output:

My cat Pudding is 7 years old and has black and white fur.
My cat Butterscotch is 10 years old and has tan and white fur.

=end

# class Pet
#   attr_reader :name, :age
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# class Cat < Pet
#   attr_reader :color
#   def initialize(name, age, color)
#     super(name, age)
#     @color = color
#   end

#   def to_s
#     "My cat #{name} is #{age} years old and has #{color} fur."
#   end
# end

# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

################
# can omit a separate `initialize` method for Cat by including an optional `color` parameter
# for Pet class. May NOT be a good idea to modify Pet class with an optional parameter
# because we will have a `nil` floating around, which may cause unexpected behavior when 
# unintentionally used in instance methods (if you create that parameter, someone is bound to use it).

class Pet
  attr_reader :name, :age, :color
  def initialize(name, age, color=false)
    @name = name
    @age = age
    @color = color if color
  end
end

class Cat < Pet
  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end
end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
charles = Cat.new('Charles', 5)
puts pudding, butterscotch, charles