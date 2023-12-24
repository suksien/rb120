=begin
Update the Card class so that #min and #max pick the card of the appropriate suit 
if two or more cards of the same rank are present in the Array.

- compare rank first, and ONLY compare suit if the ranks are equal
- numeric cards are the lowest, ordered from 2 to 10
- Ace > King > Queen > Jack > 10
- Spades > Hearts > Clubs > Diamonds
 
=end


class Card
  include Comparable
  attr_reader :rank, :suit

  RANK_VALUES = %w(Jack Queen King Ace).zip((11..14).to_a).to_h
  SUIT_VALUES = %w(Diamonds Clubs Hearts Spades).zip((1..4).to_a).to_h

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def rank_value
    RANK_VALUES[rank] ? RANK_VALUES[rank] : rank.to_i
  end

  def suit_value
    SUIT_VALUES[suit]
  end

  def <=>(other_card)
    if (rank_value <=> other_card.rank_value) == 1
      suit_value <=> other_card.suit_value
    else
      rank_value <=> other_card.rank_value
    end
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
puts cards.max == Card.new('Jack', 'Spades')
puts cards.max.rank == 'Jack'

cards = [Card.new(8, 'Diamonds'),
         Card.new(8, 'Clubs'),
         Card.new(8, 'Spades')]
puts cards.min.rank == 8
puts cards.max.rank == 8
puts cards.min == Card.new(8, 'Diamonds')
puts cards.max == Card.new(8, 'Spades')