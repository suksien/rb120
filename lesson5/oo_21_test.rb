class Card
  SUITS = %w(H D S C)
  FACES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  def initialize(suit, face)
    @suit = suit
    @face = face
  end

  def to_s
    "@{face} of @{suit}"
  end

  def ace?
    face == 'A'
  end

  def jack?
    face == 'J'
  end

  def king?
    face == 'K'
  end

  def queen?
    face == 'Q'
  end

end

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    Card::SUITS.each do |suit|
      Card::FACES.each do |face|
        @cards << Card.new(suit, face)
      end
    end

    @cards.shuffle!
  end

  def deal_one
    cards.pop
  end
end

module Hand
  def show_hand
    puts "#{name}'s Hand: #{cards.join(", ")}"
    puts "=> total: #{total}"
  end

  def total
  end

  def add_card
  end

  def busted?
  end
end

class Participant
  include Hand

  attr_accessor :name, :cards
  def initialize
    @cards = []
    set_name
  end
end

class Player < Participant
  def set_name
  end
end

class Dealer < Participant
  def set_name
  end

  def show_flop
end

class TwentyOne
  attr_accessor :deck, :human, :dealer

  def initialize
    @deck = Deck.new
    @human = Player.new
    @dealer = Dealer.new
  end

  def start
    display_welcome_message

    loop do
      deal_cards
      show_flop

      player_turn
      if player_busted?
        show_busted
        if play_again?
          reset
          next
        else
          break
        end
      end

      # repeat for dealer

      show_cards
      show_result
      play_again? ? reset : break
    end

    display_goodbye_message
  end

  private

  def deal_cards
    2.times do |_|
      player.add_card(deck.deal_one)
      dealer.add_card(deck.deal_one)
    end
  end

  def show_flop
    human.show_hand
    dealer.show_flop
  end

  def player_turn
  end

  def dealer_turn
  end

  def show_hands
    human.show_hand
    dealer.show_hand
  end
end

#######################
TwentyOne.new.start