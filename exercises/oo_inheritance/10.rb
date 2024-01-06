=begin

Create a module named Transportation that contains three classes: Vehicle, Truck, and Car. 
Truck and Car should both inherit from Vehicle.

=end

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

Transportation::Truck.new # to invoke a class within a module

=begin
In addition to grouping common behaviors for different classes, modules are also used for 
namespacing, which is when one organizes similar classes under a module. 

Namespacing is done to avoid class name collision with other similarly-named classes. 
It also makes it easier to recognize the purpose of the contained classes.
=end