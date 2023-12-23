=begin

Update this class so you can use it to determine the lowest ranking and highest ranking cards 
in an Array of Card objects:

If you have two or more cards of the same rank in your list, your min and max methods should 
return one of the matching cards; it doesn't matter which one.

Besides any methods needed to determine the lowest and highest cards, create a #to_s method that 
returns a String representation of the card, e.g., "Jack of Diamonds", "4 of Clubs", etc.
=end

=begin
- suits do not affect the ranking
- numeric cards are the lowest, ordered from 2 to 10
- Ace > King > Queen > Jack > 10
 
=end


class Card
  include Comparable
  attr_reader :rank, :suit

  HSH = %w(Jack Queen King Ace).zip((11..14).to_a).to_h

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def value
    HSH.include?(rank) ? HSH[rank] : rank.to_i
  end

  def <=>(other_card)
    value <=> other_card.value # calling the value method on the instance object
  end

  def to_s
    "#{rank} of #{suit}"
  end
end

cards = [Card.new(2, 'Hearts'),
         Card.new(10, 'Diamonds'),
         Card.new('Ace', 'Clubs')]
puts cards
puts cards.min == Card.new(2, 'Hearts')
puts cards.max == Card.new('Ace', 'Clubs')

cards = [Card.new(5, 'Hearts')]
puts cards.min == Card.new(5, 'Hearts')
puts cards.max == Card.new(5, 'Hearts')

cards = [Card.new(4, 'Hearts'),
         Card.new(4, 'Diamonds'),
         Card.new(10, 'Clubs')]
puts cards.min.rank == 4
puts cards.max == Card.new(10, 'Clubs')

cards = [Card.new(7, 'Diamonds'),
         Card.new('Jack', 'Diamonds'),
         Card.new('Jack', 'Spades')]
puts cards.min == Card.new(7, 'Diamonds')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8