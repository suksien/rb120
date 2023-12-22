require 'pry'

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9], 
                   [1, 5, 9], [3, 5, 7]]
  def initialize
    @squares = {}
    reset
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def draw
    puts ""
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |         1 | 2 | 3 "
    puts "-----+-----+----    ---+---+---"
    puts "     |     |         4 | 5 | 6"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}     ---+---+---"
    puts "     |     |         7 | 8 | 9 "
    puts ""
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      squares_at_this_line = @squares.values_at(*line)
      if three_identical_markers?(squares_at_this_line)
        return squares_at_this_line.first.marker
      end
    end
    nil
  end

  private
  def three_identical_markers?(squares)
    marked_squares = squares.select(&:marked?)
    return false if marked_squares.size != 3

    marked_squares_markers = marked_squares.map(&:marker)
    marked_squares_markers.uniq.size == 1
  end

end

class Square
  INITIAL_MARKER = " "
  attr_accessor :marker

  def initialize(marker=INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def marked?
    marker != INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

class TTTGame  
  MARKER1 = 'O'
  MARKER2 = 'X'
  COMPUTER_NAMES = ['Quasar', '3C 273', 'Andromeda', 'Hubble', 'Kobu']

  attr_reader :board, :human, :computer
  attr_accessor :current_player, :nrounds, :scoreboard

  def initialize
    puts self
    @board = Board.new
    @human = Player.new(human_name, human_marker)
    @computer = Player.new(computer_name, computer_marker)
    set_nrounds
    @current_player = @human
    @scoreboard = { @human.name => 0, @computer.name => 0 }
  end

  def set_nrounds
    total_rounds = ''
    loop do
      puts "How many rounds would you like to play? (enter a number > 0)"
      total_rounds = gets.chomp
      break if total_rounds.to_i.to_s == total_rounds && total_rounds.to_i > 0
      puts "Sorry, not a valid choice.  "
    end
    self.nrounds = total_rounds.to_i
  end

  def human_name
    name = nil
    loop do
      puts "Please enter your name: "
      name = gets.chomp
      break unless name.empty?
      puts "Sorry, must enter a value."
    end
    name
  end

  def computer_name
    COMPUTER_NAMES.sample
  end

  def human_marker
    ans = ''
    loop do
      puts "Please choose a marker: #{MARKER1} or #{MARKER2}"
      ans = gets.chomp
      break if [MARKER1, MARKER2].include?(ans.upcase)
      puts "Sorry, not a valid choice. "
    end
    ans.upcase
  end

  def computer_marker
    human.marker == MARKER1 ? MARKER2 : MARKER1
  end

  def human_moves
    square_num = nil
    loop do
      puts "Choose a square from: #{board.unmarked_keys.join(', ')} "
      square_num = gets.chomp.to_i
      break if board.unmarked_keys.include?(square_num)
      puts "Sorry, not a valid choice. "
    end
    board[square_num] = human.marker
  end

  def computer_moves
    key = board.unmarked_keys.sample
    board[key] = computer.marker
  end

  def clear_screen
    system 'clear'
  end

  def to_s
    "~~~~~~~ Welcome to Tic Tac Toe ~~~~~~~"
  end

  def display_welcome_message
    if nrounds > 1
      puts "Hi #{human.name}, you will be playing against #{computer.name} for a total of #{nrounds} rounds."
    else
      puts "Hi #{human.name}, you will be playing against #{computer.name} for a total of #{nrounds} round."
    end
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, have a great day!"
  end
 
  def display_board(this_round=nil)
    puts "Round #{this_round}:" if this_round
    puts "You are #{human.marker}, #{computer.name} is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_then_display_board(this_round=nil)
    clear_screen
    display_board(this_round)
  end

  def display_result(this_round=nil)
    clear_screen_then_display_board(this_round)

    case board.winning_marker
    when human.marker then puts "#{human.name} won this round!"
    when computer.marker then puts "#{computer.name} won this round!"
    else puts "You tie!"
    end
    puts ""
  end

  def update_scoreboard # bug here: computer score not updating
    case board.winning_marker
    when human.marker then self.scoreboard[human.name] += 1
    when computer.marker then self.scoreboard[computer.name] += 1
    end
  end

  def reset_scoreboard
    self.scoreboard = { @human.name => 0, @computer.name => 0 }
  end

  def display_grand_winner
    puts "~~~~~~~ End of game ~~~~~~~"
    human_score = scoreboard[human.name]
    win_or_wins = (human_score > 1 ? "wins" : "win")
    puts "#{human.name} has #{human_score} #{win_or_wins}"

    computer_score = scoreboard[computer.name]
    win_or_wins = (computer_score > 1 ? "wins" : "win")
    puts "#{computer.name} has #{computer_score} #{win_or_wins}"

    if human_score == computer_score
      puts "====> It's a tie! <===="
    else
      grand_winner = (human_score > computer_score ? human : computer)
      puts "====> #{grand_winner.name} is the grand winner, congrats! <===="
    end
    puts "\n"
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ""
  end

  def play_again?
    ans = nil
    loop do
      puts "Would you like to play again? (y or n) "
      ans = gets.chomp
      break if %w(y n yes no).include?(ans.downcase)
      puts "Sorry, not a valid choice. "
    end
    ans.downcase == 'y' || ans.downcase == 'yes'
  end

  def reset_round
    board.reset
    reset_scoreboard
    self.current_player = human
    sleep 1.5
    clear_screen
  end

  def reset
    board.reset
    set_nrounds
    self.current_player = human
    clear_screen
  end

  def human_turn?
    current_player == human
  end

  def switch_player
    self.current_player = (human_turn? ? computer : human)
  end

  def current_player_moves
    human_turn? ? human_moves : computer_moves
  end

  def play
    loop do
      clear_screen
      display_welcome_message
      this_round = 1

      loop do
        display_board(this_round)

        loop do
          current_player_moves
          update_scoreboard if board.someone_won?
          break if board.someone_won? || board.full?
          switch_player
          clear_screen_then_display_board(this_round) if human_turn?
        end

        display_result

        this_round += 1
        break if this_round > nrounds

        reset_round
      end

      display_grand_winner
      break unless play_again?

      reset # need to test if reseting scoreboard works if play again
      display_play_again_message
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play