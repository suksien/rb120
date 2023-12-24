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

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  attr_reader :deck

  def initialize
    @deck = []
    reset
  end

  def draw
    reset if deck.empty?
    deck.pop
  end

  def to_s
    deck.map { |card| card.to_s }.to_s
  end

  private
  
  attr_writer :deck

  def reset
    populate
    shuffle_cards!
  end

  def populate
    RANKS.each do |rank|
      SUITS.each do |suit|
        self.deck << Card.new(rank, suit)
      end
    end
  end

  def shuffle_cards!
    deck.shuffle!
  end
end

# Create a class, PokerHand, that takes 5 cards from a Deck of Cards and evaluates those cards 
# as a Poker hand. You should build your class using the following code skeleton:

# Include Card and Deck classes from the last two exercises.

class PokerHand
  ROYAL_FLUSH_RANKS = %w(Ace King Queen Jack) + [10]
  attr_reader :hand

  def initialize(deck)
    @hand = []
    5.times { @hand << deck.draw }
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def get_hand_suits
    hand.map(&:suit)
  end

  def get_hand_ranks
    hand.map(&:rank)
  end

  def flush?
    # Five cards of the same suit
    get_hand_suits.uniq.size == 1
  end

  def straight?
    index = Deck::RANKS.index(hand.min.rank)
    straight_ranks = Deck::RANKS[index, 5]

    ranks = get_hand_ranks
    straight_ranks.all? { |one_card_rank| ranks.count(one_card_rank) == 1 }
  end

  def straight_flush?
    # Five cards of the same suit in sequence (if those five are A, K, Q, J, 10; it is a Royal Flush)
    straight? && flush?
  end

  def royal?
    get_hand_ranks.all? { |one_card_rank| ROYAL_FLUSH_RANKS.include?(one_card_rank) }
  end

  def royal_flush?  
    straight_flush? && royal?
  end

  def four_of_a_kind?
    # Four cards of the same rank and any one other card
    ranks = get_hand_ranks
    uniq_ranks = ranks.uniq

    uniq_ranks.one? { |one_card_rank| ranks.count(one_card_rank) == 4 }
  end

  def full_house?
    # Three cards of one rank and two of another
    ranks = get_hand_ranks
    uniq_ranks = ranks.uniq

    uniq_ranks.one? { |one_card_rank| ranks.count(one_card_rank) == 3 } && 
    uniq_ranks.one? { |one_card_rank| ranks.count(one_card_rank) == 2 }
  end

  def three_of_a_kind?
    # Three cards of the same rank
    ranks = get_hand_ranks
    uniq_ranks = get_hand_ranks.uniq

    uniq_ranks.one? { |one_card_rank| ranks.count(one_card_rank) == 3 }
  end

  def two_pair?
    # Two cards of one rank and two cards of another
    ranks = get_hand_ranks
    uniq_ranks = get_hand_ranks.uniq

    uniq_ranks.count { |one_card_rank| ranks.count(one_card_rank) == 2 } == 2 &&
    uniq_ranks.one? { |one_card_rank| ranks.count(one_card_rank) == 1 }
  end

  def pair?
    # Two cards of the same rank
    ranks = get_hand_ranks
    uniq_ranks = get_hand_ranks.uniq

    uniq_ranks.any? { |one_card_rank| ranks.count(one_card_rank) == 2 }
  end
end

########
hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

#Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

=begin
Further exploration: (Sketch)

1. How would you modify our original solution to choose the best hand between two poker hands?

# need to mixin Comparable module and define <=> for PokerHand class

hand1 = PokerHand.new(Deck.new)
hand2 = PokerHand.new(Deck.new)

if hand1.value != hand2.value
  if hand1.value > hand2.value
    best_hand = hand1
  else
    best_hand = hand2
  end
end

2. How would you modify our original solution to choose the best 5-card hand from a 7-card poker hand?

# define methods to determine if any 5 cards from amomg the 7 cards can form royal flush, 
straight flush, four of a kind etc?

def best_hand
    case
    when can_royal_flush?     then get_royal_flush_hand
    when can_straight_flush?  then get_straight_flush_hand
    when can_four_of_a_kind?  then get_four_hand
    when can_full_house?      then ...
    when can_flush?           then ...
    when can_straight?        then ...
    when can_three_of_a_kind? then ..
    when can_two_pair?        then ...
    when can_pair?            then ...
    else                       ...
    end
end
=end