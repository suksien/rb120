class Move
  VALUES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
  def initialize(value)
    @value = value
  end

  def scissors?; @value == 'scissors'; end
  def paper?; @value == 'paper'; end
  def rock?; @value == 'rock'; end
  def lizard?; @value == 'lizard'; end
  def spock?; @value == 'spock'; end

  def >(other_move)
    if rock?
      other_move.scissors? || other_move.lizard?
    elsif paper?
      other_move.rock? || other_move.spock?
    elsif scissors?
      other_move.paper? || other_move.lizard?
    elsif lizard?
      other_move.paper? || other_move.spock?
    elsif spock?
      other_move.rock? || other_move.scissors?
    end
  end

  def <(other_move)
    other_move > self
  end

  def to_s
    @value
  end
end

class Player
  attr_accessor :move, :name, :all_moves, :total_score

  def initialize
    set_name
    self.all_moves = []
    self.total_score = 0
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
      puts "Please choose one: #{Move::VALUES.join(', ')}"
      choice = gets.chomp
      break if Move::VALUES.include?(choice)
      puts "Sorry, not a valid choice. "
    end
    self.move = Move.new(choice)
    self.all_moves << self.move
  end
end

class Computer < Player
  def initialize
    super
    @available_moves = set_available_moves
    @intro = set_intro
  end

  def set_name
    self.name = ['R2D2', 'C3PO', 'Quasar', 'Galaxy', 'Kobu'].sample
  end

  def set_available_moves
    case self.name
    when 'R2D2' then Move::VALUES
    when 'C3PO' then Move::VALUES - ['lizard']
    when 'Quasar' then Move::VALUES - ['spock']
    when 'Galaxy' then Move::VALUES - ['scissors', 'paper'] + ['rock'] * 10
    when 'Kobu' then Move::VALUES - ['scissors'] + ['lizard'] * 10
    end
  end

  def set_intro
    case self.name
    when 'R2D2'
      "#{self.name} espouses equality and will choose all moves equally likely!"
    when 'C3PO'
      "#{self.name} dislikes lizard and will avoid it at all costs!"
    when 'Quasar'
      "#{self.name} and Spock had some disagreement a while ago and it will be a while before Quasar will choose spock again :("
    when 'Galaxy'
      "#{self.name} absolutely loves rock but thinks that scissors and papers do not match its fengshui!"
    when 'Kobu'
      "Lizard is #{self.name}'s favorite toy but he dislikes anything metallic!"
    end
  end

  def intro
    @intro
  end

  def choose
    self.move = Move.new(@available_moves.sample)
    self.all_moves << self.move
  end
end

class RPSGame
  attr_accessor :human, :computer
  GAME_POINT = 3

  def initialize
    @human = Human.new
    @computer = Computer.new
  end

  def display_welcome_message
    puts "===== Welcome to RPSLS! ====="
    puts "Whoever reaches #{GAME_POINT} points first wins the game!"
    puts "\n"
    puts "#{computer.name} has entered the game"
    puts "(#{computer.intro})"
    puts "\n"
  end

  def display_all_moves
    puts "Here are all the moves #{human.name} and #{computer.name} have made:"
    human.all_moves.each_index do |index|
      puts "#{human.all_moves[index]} vs. #{computer.all_moves[index]}"
    end
    puts "\n"
  end

  def display_player_scores
    human_ending = (human.total_score > 1 ? "wins" : "win")
    computer_ending = (computer.total_score > 1 ? "wins" : "win")

    puts "#{human.name} has #{human.total_score} #{human_ending}"
    puts "#{computer.name} has #{computer.total_score} #{computer_ending}"

    grand_winner = (human.total_score > computer.total_score ? human : computer)
    puts "====> #{grand_winner.name} is the grand winner, congrats! <===="
    puts "\n"
  end

  def display_goodbye_message
    puts "Thank you for playing!"
  end

  def display_winner
    puts "#{human.name} chose #{human.move}"
    puts "#{computer.name} chose #{computer.move}"
    
    if human.move > computer.move
      puts "#{human.name} wins!"
      human.total_score += 1
    elsif human.move < computer.move
      puts "#{computer.name} wins!"
      computer.total_score += 1
    else
      puts "It's a tie!"
    end
    puts "\n"
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
    until human.total_score >= GAME_POINT || computer.total_score >= GAME_POINT
      human.choose
      computer.choose
      display_winner
      #break unless play_again?
    end

    display_all_moves
    display_player_scores
    display_goodbye_message
  end
  
end

RPSGame.new.play

# TODO: results of each round in history of moves