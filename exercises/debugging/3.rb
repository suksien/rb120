class Person
  attr_reader :name
  attr_accessor :location

  def initialize(name)
    @name = name
  end

  def teleport_to(latitude, longitude)
    @location = GeoLocation.new(latitude, longitude)
  end

end

class GeoLocation
  attr_reader :latitude, :longitude

  def initialize(latitude, longitude)
    @latitude = latitude
    @longitude = longitude
  end

  def to_s
    "(#{latitude}, #{longitude})"
  end

  # proposed fix:
  def ==(other_loc)
    latitude == other_loc.latitude && longitude == other_loc.longitude
  end
end

# Example

ada = Person.new('Ada')
ada.location = GeoLocation.new(53.477, -2.236)

grace = Person.new('Grace')
grace.location = GeoLocation.new(-33.89, 151.277)

ada.teleport_to(-33.89, 151.277)

puts ada.location                   # (-33.89, 151.277)
puts grace.location                 # (-33.89, 151.277)
puts ada.location == grace.location # expected: true
                                    # actual: false

=begin
Line 39 returns `false` because `==` is comparing if the `GeoLocation` objects of 
`ada` and `grace` are pointing to the same object. This is because we do not
provide a custom `==` method for a `GeoLocation` object, so by default `BasicObject#==`
is invoked, which returns `true` only when two variables are pointing to the same object. 

The intent here is to compare if the `latitute` and `longiture` of `ada.location` and 
`grace.location` are the same. To fix, we need to a define a custom `==` method in the 
`GeoLocation` class that compares the values of `latitude` and `longitude` of two instances 
of `GeoLocation` objects.

=end