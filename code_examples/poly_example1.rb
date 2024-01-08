# polymorphism via class inheritance and modules mixin

module Redeemable
	def redeem_points
		puts "redeeming points"
	end
end

class Bookings
	def book
		puts "booked"
	end
end

class Flight < Bookings
	include Redeemable
end

class Hotel < Bookings
	include Redeemable
end

class RideShare < Bookings
end

flight = Flight.new
hotel = Hotel.new
uber = RideShare.new

flight.book # booked
hotel.book # booked
uber.book # booked

flight.redeem_points # redeeming points
hotel.redeem_points # redeeming points

=begin
Flight, Hotel, and RideShare are different types of Bookings that are unrelated to one another
- all three can be "booked", but only Flight and Hotel can be used to redeem points on credit card.

We can extract out the common `book` behavior into the superclass so it is available to its subclasses. 
Rather than defining a separate method to redeem points in both Flight and Hotel, we can instead extract
it out in a module and then mix it in to Flight and Hotel. This way, we achieve DRYer codes that are more
easily maintainable. 

By inheriting from the `Bookings` superclass, all classes can be used to perform booking. By mixing in 
`Redeemable` module where it is needed, Flight and Hotel objects can redeem points but RideShare objects
cannot.  

Note: when the `Bookings` superclass is removed, this code is then demonstrating polymorphism via duck-
typing through the `redeem_points` behavior. This is because Flight and Hotel are unrelated to each other
but both respond to the same `redeem_points` method call. 
=end