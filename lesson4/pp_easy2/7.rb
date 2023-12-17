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

# @@cat_counts keeps track of how many `Cat` objects have been created: its value
# gets incremented by 1 each time a new object is instantiated

Cat.new('domestic short hair')
Cat.new('long hair')
p Cat.cats_count