module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

p Orange.ancestors # [Orange, Taste, Object, Kernel, BasicObject]
p HotSauce.ancestors # [HotSauce, Taste, Object, Kernel, BasicObject]

=begin
The method lookup path can be viewed by calling `::ancestors` on the class, which will 
return an array of classes starting from itself, the last mixed-in module, any superclasses and
so on.

If no such method is found, Ruby will raise `NoMethodError`.

=end

# key point: ancestors method