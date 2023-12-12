class Player
  attr_accessor :move, :name
  def initialize
    set_name
  end
end

class Human < Player
  def set_name
    name = nil
    loop do
      puts "Enter your name: "
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    self.name = name
  end

  def choose
    choice = nil
    loop do
      puts "Please choose one: rock, paper, scissors"
      choice = gets.chomp
      break if ['rock', 'paper', 'scissors'].include?(choice)
      puts "Sorry, not a valid choice. "
    end
    self.move = choice
  end
end

class Computer < Player
  def set_name
    self.name = ["R2D2", 'C3PO', 'Quasar', 'Galaxy'].sample
  end

  def choose
    self.move = ['rock', 'paper', 'scissors'].sample
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Human.new
    @computer = Computer.new
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

# more object-oriented, cleaner code
# repeated method names for the different classes; more classes 
# (maybe Player class no longer needed?)