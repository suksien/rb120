
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

=begin

Using the Card class from the previous exercise, create a Deck class that contains all of the standard 
52 playing cards. Use the following code to start your work:

The Deck class should provide a #draw method to deal one card. The Deck should be shuffled when 
it is initialized and, if it runs out of cards, it should reset itself by generating a new set 
of 52 shuffled cards.

=end

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


deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.