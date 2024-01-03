class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Both are right. On line 9, Ben is intending to call the `balance` getter method, 
# since he called the `attr_reader` method on the `@balance` instance variable. Alyssa 
# is right as well because that line also works by referencing the instance variable 
# directly. However, using getter methods to reference instance variables are generally 
# preferred over referencing the instance variables directly.

=begin
Ben is right. This is because he explicitly included an `attr_reader` for the `@balance`
instance variable, which will return the value of `@balance`. His intention on line 9 is 
to call the getter method `balance`, instead of directly referencing `@balance`.

=end

# key point: calling getter/setter or referencing instance variable