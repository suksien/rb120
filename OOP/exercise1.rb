=begin
Objects are created by (i) defining a class and (ii) instantiating it using the #.new method call.
=end

=begin

A module is a collection of behaviors (not necessarily method definitions?) that can be made 
available/shared among different classes via mixins, i.e. by invoking the #include method 
followed by the module name.

Purpose of a module is so that codes can be reused and shared among different classes. 
Extend the functionality of the class. 
=end

module Sound
  def make_sound(sound)
    puts sound
  end
end

class Car
  include Sound
end

new_car = Car.new
new_car.make_sound("honk honk!")