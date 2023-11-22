class Person
  attr_accessor :first_name, :last_name
  def initialize(full_name)
    parse_full_name(full_name)
  end

  def name
    "#{first_name} #{last_name}"
  end

  def name=(input_name)
   parse_full_name(input_name)
  end

  def to_s
    name
  end

  private
  def parse_full_name(name)
    words = name.split
    self.first_name = words[0]
    self.last_name = (words.size > 1 ? words[-1] : '')
  end
end

#=======
bob = Person.new('Robert')
p bob.name                  # => 'Robert'
p bob.first_name            # => 'Robert'
p bob.last_name             # => ''
bob.last_name = 'Smith'
p bob.name                  # => 'Robert Smith'

bob.name = "John Adams"
p bob.first_name            # => 'John'
p bob.last_name             # => 'Adams'

#=======
bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')

puts bob