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