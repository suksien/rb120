=begin

Using the following code, add a method named share_secret that prints the value of @secret when invoked.

=end

class Person
  attr_writer :secret

  def share_secret
    puts secret # calling the private #secret getter method
  end

  private

  attr_reader :secret
end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'
person1.share_secret

# key point: making methods private