=begin

Using the following code, add an instance method named compare_secret that compares the value 
of @secret from person1 with the value of @secret from person2.

=end

class Person
  attr_writer :secret

  def compare_secret(person2)
    secret == person2.secret
  end

  protected

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)

=begin
The getter method `secret` is a protected method because we invoke the `protected` method
before the method definition. A protected method can only be called from within the class
and it can be called on multiple instances of the class. Therefore, the `compare_secret` method 
can invoke the getter not just on the current calling object but also on another class instance, 
referenced by `person2`.

=end

# key point: protected methods