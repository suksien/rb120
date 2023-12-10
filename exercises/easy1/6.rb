=begin

There is nothing technically incorrect about this class, but the definition may lead to 
problems in the future. How can this class be fixed to be resistant to future problems?

Hint: 
Consider what might happen if you leave this class defined as it is, and later decide to 
alter the implementation so that a database is not used.

=end

class Flight
  #attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

