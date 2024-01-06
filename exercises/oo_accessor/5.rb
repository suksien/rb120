=begin

Using the following code, add the appropriate accessor methods. 
Keep in mind that @age should only be visible to instances of Person.

=end

class Person
  attr_writer :age

  def older_than?(other)
    age > other.age
  end

  protected

  attr_reader :age
end

person1 = Person.new
person1.age = 17

person2 = Person.new
person2.age = 26

puts person1.older_than?(person2)

=begin
Protected methods are defined by placing them after the call to `protected`. 

In this case, the protected method is the getter method for the `@age` instance variable. 
When a method is protected, it cannot be invoked outside the class but it can be invoked
inside the class by multiple instances of the class or subclass.

On line 11, we define an `older_than?` public method that calls the protected getter
on the current calling object as well as another `Person` instance referenced by `other`.
=end