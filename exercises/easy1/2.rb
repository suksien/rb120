class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    @name.upcase!
    "My name is #{@name}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # Fluffy
puts fluffy # My name is FLUFFY.
puts fluffy.name # FLUFFY
puts name # FLUFFY

=begin

What output does this code print? 

- line 15, creating a Pet object and passing in the string "Fluffy" to the @name instance var
- line 16 is calling the getter method (line 2) and returning the string object referenced by 
the instance var @name, which is "Fluffy". The string object is then passed as argument to the 
puts method call, which results in "Fluffy" being printed. 
- the puts method call automatically calls to_s on its argument, but this to_s is NOT the to_s 
method defined in line 8, but rather the default to_s method. This is because the puts method 
is called on a string object. 

- line 17, we are calling the to_s method on the Pet object referenced by the variable `fluffy`, 
which will cause the default `to_s` to be overriden by the custom `to_s` method defined on line 8. 
As a result, line 9 will mutate the string referenced by `@name` to be in uppercase and line 10 
will output My name is FLUFFY. 

- the mutating `upcase!` call on line 9 will cause the initial string object referenced by both 
`name` and `@name` to be in uppercase, so line 18 and 19 both output FLUFFY.

=end

# Fix this class so that there are no surprises waiting in store for the unsuspecting developer.

p "======"
class Pet
  attr_reader :name

  def initialize(name)
    @name = name.to_s
  end

  def to_s
    "My name is #{@name.upcase}."
  end
end

name = 'Fluffy'
fluffy = Pet.new(name)
puts fluffy.name # Fluffy
puts fluffy # My name is FLUFFY.
puts fluffy.name # Fluffy
# puts name # Fluffy

# Further exploration
p "======"
name = 42
fluffy = Pet.new(name) # here, the `to_s` is calling the `Integer#to_s`` method, not `Pet#to_s` method
name += 1 # `name` now points to a new integer, 43
puts fluffy.name # 42
puts fluffy # My name is 42.
puts fluffy.name # 42
puts name # 43