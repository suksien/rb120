=begin

The implementation details for the #initialize methods in Graduate and Undergraduate are missing. 

Fill in those missing details so that the following requirements are fulfilled:
- Graduate students have the option to use on-campus parking, while Undergraduate students do not.
- Graduate and Undergraduate students both have a name and year associated with them.

=end


class Student
  attr_reader :name, :year
  def initialize(name, year)
    @name = name
    @year = year
  end
end

class Graduate < Student
  attr_reader :parking
  def initialize(name, year, parking=nil)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

ss = Graduate.new('Suk Sien', '2014')
p ss.name
p ss.year
p ss.parking

old_ss = Undergraduate.new('Suk Sien', '2009')
p old_ss.year