=begin

Modify the House class so that the above program will work. 
You are permitted to define only one new method in House.

Expected output:

Home 1 is cheaper
Home 2 is more expensive

=end

class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  # the custom class must define the <=> operator, like so
  # the Comparable module uses <=> to implement the conventional comparison operators 
  # (<, <=, ==, >=, and >) and the method `#between?`
  def <=>(other_home)
    price <=> other_home.price
  end
end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

# Price is not the only thing you want to compare for a Home object; 
# other attributes include the size of Home, age of Home, number of bedrooms in Home etc.
# more natural to do `home1.price > home2.price`