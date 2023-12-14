=begin

Modify this code so it works. Do not make the amount in the wallet accessible 
to any method that isn't part of the Wallet class.

=end

class Wallet
  include Comparable

  def initialize(amount)
    @amount = amount
  end

  def <=>(other_wallet)
    amount <=> other_wallet.amount
  end

  protected
  attr_reader :amount
end

bills_wallet = Wallet.new(500)
pennys_wallet = Wallet.new(465)
if bills_wallet > pennys_wallet
  puts 'Bill has more money than Penny'
elsif bills_wallet < pennys_wallet
  puts 'Penny has more money than Bill'
else
  puts 'Bill and Penny have the same amount of money.'
end

=begin

Use cases for protected methods is quite similar to private methods, except you need it in cases
when you need to do sth with sensitive data of multiple objects of a class.

e.g.  ID numbers, grades, health records, bank account, personal info (home address, phone number etc), 
exam answers
=end