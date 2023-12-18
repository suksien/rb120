class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

# we can reference and reassign the `@age` instance method directly by replacing 
# that line with `@age += 1`.