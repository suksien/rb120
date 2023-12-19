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

  def get_square_at(key)
    @squares[key]
  end

  def mark_square_at(key, marker)
    @squares[key].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!detect_winner
  end

  def count_human_marker(squares)
    squares.map(&:marker).count(TTTGame::HUMAN_MARKER)
  end

  def count_computer_marker(squares)
    squares.map(&:marker).count(TTTGame::COMPUTER_MARKER)
  end
  
  def detect_winner
    human_marker = TTTGame::HUMAN_MARKER
    computer_marker = TTTGame::COMPUTER_MARKER

    WINNING_LINES.each do |line|
      squares_at_this_line = @squares.values_at(*line)

      if count_human_marker(squares_at_this_line) == 3
        return human_marker
      elsif count_computer_marker(squares_at_this_line) == 3
        return computer_marker
      end

    end
    nil
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

  def unmarked?
    marker == INITIAL_MARKER
  end
end

class Player
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def human_moves
    square_num = nil
    loop do
      puts "Choose a square from: #{board.unmarked_keys.join(', ')} "
      square_num = gets.chomp.to_i
      break if board.unmarked_keys.include?(square_num)
      puts "Sorry, not a valid choice. "
    end
    board.mark_square_at(square_num, human.marker)
  end

  def computer_moves
    board.mark_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, have a great day!"
  end
 
  def display_board(clear_screen=true)
    system('clear') if clear_screen
    puts "You are #{human.marker}, computer is #{computer.marker}"
    puts ""
    puts "     |     |"
    puts "  #{board.get_square_at(1)}  |  #{board.get_square_at(2)}  |  #{board.get_square_at(3)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(4)}  |  #{board.get_square_at(5)}  |  #{board.get_square_at(6)}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{board.get_square_at(7)}  |  #{board.get_square_at(8)}  |  #{board.get_square_at(9)}"
    puts "     |     |"
    puts ""
  end

  def display_result
    display_board
    case board.detect_winner
    when human.marker then puts "You won!"
    when computer.marker then puts "Computer won!"
    else puts "You tie!"
    end
  end

  def play_again?
    ans = nil
    loop do
      puts "Would you like to play again? (y or n) "
      ans = gets.chomp
      break if %w(y n).include?(ans)
      puts "Sorry, not a valid choice. "
    end
    ans == 'y'
  end

  def play
    system 'clear'
    display_welcome_message

    loop do
      display_board(clear_screen=false)

      loop do
        human_moves
        break if board.someone_won? || board.full?
        
        computer_moves
        break if board.someone_won? || board.full?

        display_board
        
      end

      display_result
      break unless play_again?
      board.reset
      system 'clear'
      puts "Let's play again!"
      puts ""
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play