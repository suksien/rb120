class Player
  attr_accessor :move, :name

  def initialize(player_type)
    @player_type = player_type
    @move = nil
    set_name
  end

  def set_name
    if human?
      name = nil
      loop do
        puts "Enter your name: "
        name = gets.chomp
        break unless name.empty?
        puts "Sorry, must enter a value."
      end
      self.name = name
    else
      self.name = ["R2D2", 'C3PO', 'Quasar', 'Galaxy'].sample
    end
  end

  def choose
    if human?
      choice = nil
      loop do
        puts "Please choose one: rock, paper, scissors"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry, not a valid choice. "
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class Move
  def initialize
  end
end

class Rule
  def initialize
  end
end

# engine
class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new(:human)
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to Rock, Paper, Scissors!"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end

  def win?(first, second)
    (first == "rock" && second == "scissors") ||
    (first == "paper" && second == "rock") ||
    (first == "scissors" && second == "paper")
  end

  def display_winner
    puts "#{human.name} chose #{human.move.upcase}, #{computer.name} chose #{computer.move.upcase}."
    if win?(human.move, computer.move)
      puts "#{human.name} wins!"
    elsif win?(computer.move, human.move)
      puts "#{computer.name} wins!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    ans = nil
    loop do
      puts "Do you want to play again? (y/n)"
      ans = gets.chomp
      break if ['y', 'n'].include?(ans.downcase)
      puts "Sorry, must be y or n."
    end
    ans == "y"
  end

  def play
    display_welcome_message
    loop do
      human.choose
      computer.choose
      display_winner 
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play