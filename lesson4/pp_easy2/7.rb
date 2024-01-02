# Explain what the @@cats_count variable does and how it works. 
# What code would you need to write to test your theory?

class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

Cat.new('domestic short hair')
p Cat.cats_count # 1

Cat.new('long hair')
p Cat.cats_count # 2

=begin
`@@cats_count` is a class variable because it is prefixed with `@@`. Its function is to 
keep track of the state of the `Cat` class as a whole, rather than the state of any individual
`Cat` objects. Here, its function is to keep track of the number of `Cat` objects that have been 
instantiated; its value gets incremented by 1 each time a new object is created.

=end

# key point: class variable