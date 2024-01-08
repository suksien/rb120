# polymorphism via duck-typing

module Bookable
  def book(customer_name, date)
    puts "Booking a #{self.class.to_s.downcase} for #{customer_name} for #{date}"
  end
end

class Flight 
  include Bookable
end

class Hotel 
  include Bookable
end

class RideShare 
  include Bookable
end

flight = Flight.new
hotel = Hotel.new
uber = RideShare.new

bookings = [flight, hotel, uber]

bookings.each do |booking|
  booking.book('Joe', '2024/1/1')
end

# Booking a flight for Joe for 2024/1/1
# Booking a hotel for Joe for 2024/1/1
# Booking a rideshare for Joe for 2024/1/1

