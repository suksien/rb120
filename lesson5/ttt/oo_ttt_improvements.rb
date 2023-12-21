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
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |  #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |  #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |  #{@squares[9]}"
    puts "     |     |"
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
  attr_reader :marker
  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  
  attr_reader :board, :human, :computer
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
    @current_player = @human
  end

  def clear_screen
    system 'clear'
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

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe, have a great day!"
  end
 
  def display_board()
    puts "You are #{human.marker}, computer is #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_then_display_board
    clear_screen
    display_board
  end

  def display_result
    clear_screen_then_display_board

    case board.winning_marker
    when human.marker then puts "You won!"
    when computer.marker then puts "Computer won!"
    else puts "You tie!"
    end
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
      break if %w(y n).include?(ans)
      puts "Sorry, not a valid choice. "
    end
    ans == 'y'
  end

  def reset
    board.reset
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
    clear_screen
    display_welcome_message

    loop do
      display_board
  
      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        switch_player
        clear_screen_then_display_board if human_turn?
      end

      display_result
      break unless play_again?
      reset
      display_play_again_message
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play