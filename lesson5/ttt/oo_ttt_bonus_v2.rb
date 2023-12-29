module Promptable
  def prompt_for_number_of_rounds(min_rounds, max_rounds)
    total_rounds = ''
    loop do
      puts "How many rounds would you like to play? (enter a number between #{min_rounds} and #{max_rounds})"
      total_rounds = gets.chomp
      break if total_rounds.to_i.to_s == total_rounds &&
               total_rounds.to_i >= min_rounds && total_rounds.to_i <= max_rounds

      puts 'Sorry, not a valid choice.'
    end
    total_rounds.to_i
  end

  def prompt_for_name
    name = nil
    loop do
      puts 'Please enter your name: '
      name = gets.chomp
      break unless name.strip.empty?

      puts 'Sorry, must enter a value.'
    end
    name.strip
  end

  def prompt_for_marker(choice1, choice2)
    ans = ''
    loop do
      puts "Please choose a marker: #{choice1} or #{choice2}"
      ans = gets.chomp
      break if [choice1, choice2].include?(ans.upcase)

      puts 'Sorry, not a valid choice. '
    end
    ans.upcase
  end

  def prompt_for_move(board)
    square_num = nil
    loop do
      puts "Choose a square from: #{board.unmarked_keys.join(', ')} "
      square_num = gets.chomp.to_i
      break if board.unmarked_keys.include?(square_num)

      puts 'Sorry, not a valid choice. '
    end
    square_num
  end

  def play_again?
    ans = nil
    loop do
      puts 'Would you like to play again? (y or n)'
      ans = gets.chomp
      break if %w(y n yes no).include?(ans.downcase)

      puts 'Sorry, not a valid choice. '
    end
    ans.downcase == 'y' || ans.downcase == 'yes'
  end
end

module Displayable
  def clear_screen
    system 'clear'
  end

  def display_welcome_message(human, computer)
    round_or_rounds = (nrounds > 1 ? 'rounds' : 'round')
    puts "Hi #{human.name}, you will play against #{computer.name} for a total of #{nrounds} #{round_or_rounds}."
    puts computer.intro
    puts ''
  end

  def display_goodbye_message
    puts ''
    puts 'Thanks for playing Tic Tac Toe, have a great day!'
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def display_scoreboard(scoreboard, human, computer)
    puts "Current score: #{human.name} #{scoreboard[human.name]}, #{computer.name} #{scoreboard[computer.name]}"
  end

  def display_final_results(scoreboard, human, computer)
    human_score = scoreboard[human.name]
    win_or_wins = (human_score > 1 ? 'wins' : 'win')
    puts "#{human.name} has #{human_score} #{win_or_wins}"

    computer_score = scoreboard[computer.name]
    win_or_wins = (computer_score > 1 ? 'wins' : 'win')
    puts "#{computer.name} has #{computer_score} #{win_or_wins}"
  end

  def display_grand_winner(scoreboard, human, computer)
    puts '~~~~~~~ End of game ~~~~~~~'
    display_final_results(scoreboard, human, computer)

    human_score = scoreboard[human.name]
    computer_score = scoreboard[computer.name]
    if human_score == computer_score
      puts "====> It's a tie! <====\n\n"
    else
      grand_winner = (human_score > computer_score ? human : computer)
      puts "====> #{grand_winner.name} is the grand winner, congrats! <====\n\n"
    end
  end

  def display_board(board, human, computer, scoreboard, this_round = nil)
    puts "=== Round #{this_round} ===" if this_round
    display_scoreboard(scoreboard, human, computer)
    puts
    puts "#{human.name} is #{human.marker}, #{computer.name} is #{computer.marker}"
    board.draw
    puts ''
  end

  def clear_screen_then_display_board(board, human, computer, scoreboard,
                                      this_round = nil)
    clear_screen
    display_board(board, human, computer, scoreboard, this_round)
  end

  def announce_winner(board, human, computer)
    case board.winning_marker
    when human.marker then puts "#{human.name} won this round!"
    when computer.marker then puts "#{computer.name} won this round!"
    else puts 'You tie!'
    end
    puts ''
  end
end

class Board
  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
                   [1, 4, 7], [2, 5, 8], [3, 6, 9],
                   [1, 5, 9], [3, 5, 7]].freeze

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

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def draw
    puts ''
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
    puts ''
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

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

  def squares_with_one_spot_left(marker)
    square = []
    WINNING_LINES.each do |line|
      line_markers = @squares.values_at(*line).map(&:marker)
      if line_markers.count(marker) == 2 && line_markers.count(Square::INITIAL_MARKER) == 1
        square_num = line[line_markers.index(Square::INITIAL_MARKER)]
        square << square_num
      end
    end
    square
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
  INITIAL_MARKER = ' '.freeze
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
  attr_accessor :name, :marker, :score

  def initialize(name, marker)
    @name = name
    @marker = marker
    @score = 0
  end
end

class Human < Player
  include Promptable

  def initialize
    super(prompt_for_name, prompt_for_marker(TTTGame::MARKER1,
                                             TTTGame::MARKER2))
  end

  def moves(board)
    board[prompt_for_move(board)] = marker
  end
end

class Computer < Player
  BEHAVIORS = { '3C 273' => :regular, 'Andromeda' => :regular, 'Quasar' => :regular,
                'Hubble' => :smart, 'Kobu' => :smart, 'R2D2' => :smart }

  def initialize(marker)
    set_name
    super(name, marker)
  end

  def set_name
    self.name = Computer::BEHAVIORS.keys.sample
  end

  def intro
    if smart?
      "#{name} is an AI, good luck!"
    else
      "Phew, #{name} is not an AI, good luck!"
    end
  end

  def moves(board, opponent_marker)
    if smart?
      ai_moves(board, opponent_marker)
    else
      regular_moves(board)
    end
  end

  private

  def smart?
    BEHAVIORS[name] == :smart
  end

  def random_square(board)
    board.unmarked_keys.sample
  end

  def square_five(board)
    return unless board.unmarked_keys.include?(5)
    5
  end

  def winning_square(board)
    available_squares = board.squares_with_one_spot_left(marker)
    unless available_squares.empty?
      key = available_squares.sample
    end
    key
  end

  def threatened_square(board, opponent_marker)
    available_squares = board.squares_with_one_spot_left(opponent_marker)
    unless available_squares.empty?
      key = available_squares.sample
    end
    key
  end

  def regular_moves(board)
    board[random_square(board)] = marker
  end

  def ai_moves(board, opponent_marker)
    available_squares = [winning_square(board),
                         threatened_square(board, opponent_marker), square_five(board), random_square(board)]
    best_square = available_squares.find { |sq| !!sq }
    board[best_square] = marker
  end
end

###################################
class TTTGame
  include Promptable, Displayable

  MARKER1 = 'O'.freeze
  MARKER2 = 'X'.freeze
  MIN_ROUND = 1
  MAX_ROUND = 10

  attr_reader :board, :human, :computer
  attr_accessor :current_player, :nrounds, :scoreboard, :first_player

  def initialize
    puts self
    @board = Board.new
    @human = Human.new

    available_marker = (human.marker == MARKER1 ? MARKER2 : MARKER1)
    @computer = Computer.new(available_marker)

    set_up_game
  end

  def set_up_game
    @nrounds = prompt_for_number_of_rounds(MIN_ROUND, MAX_ROUND)
    @first_player = @human
    @current_player = @first_player
    @scoreboard = { @human.name => @human.score,
                    @computer.name => @computer.score }
  end

  def to_s
    '~~~~~~~ Welcome to Tic Tac Toe ~~~~~~~'
  end

  def update_scoreboard
    case board.winning_marker
    when human.marker then scoreboard[human.name] += 1
    when computer.marker then scoreboard[computer.name] += 1
    end
  end

  def reset_scoreboard
    self.scoreboard = { human.name => 0, computer.name => 0 }
  end

  def reset_round
    board.reset
    switch_first_player
    sleep 1.5
    clear_screen
  end

  def reset_game
    computer.set_name
    board.reset
    self.nrounds = prompt_for_number_of_rounds(MIN_ROUND, MAX_ROUND)
    reset_scoreboard
    self.first_player = human
    self.current_player = human
    clear_screen
  end

  def human_turn?
    current_player == human
  end

  def switch_player
    self.current_player = (human_turn? ? computer : human)
  end

  def switch_first_player
    self.first_player = (first_player == human ? computer : human)
    self.current_player = first_player
  end

  def current_player_moves
    human_turn? ? human.moves(board) : computer.moves(board, human.marker)
  end

  def game_over?
    board.someone_won? || board.full?
  end

  def play_one_round(round_number)
    loop do
      current_player_moves
      break if game_over?

      switch_player
      if human_turn?
        clear_screen_then_display_board(board, human, computer, scoreboard,
                                        round_number)
      end
    end
  end

  def display_round_results(round_number)
    clear_screen_then_display_board(board, human, computer, scoreboard,
                                    round_number)
    announce_winner(board, human, computer)
    update_scoreboard if board.someone_won?
  end

  def prepare_to_start
    clear_screen
    display_welcome_message(human, computer)
  end

  def play_one_game
    prepare_to_start
    this_round = 1

    loop do
      display_board(board, human, computer, scoreboard, this_round)
      play_one_round(this_round)
      display_round_results(this_round)

      this_round += 1
      break if this_round > nrounds

      reset_round
    end

    display_grand_winner(scoreboard, human, computer)
  end

  def play
    loop do
      play_one_game
      break unless play_again?

      display_play_again_message
      reset_game
    end

    display_goodbye_message
  end
end

game = TTTGame.new
game.play
