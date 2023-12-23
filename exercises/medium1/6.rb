=begin

Create an object-oriented number guessing class for numbers in the range 1 to 100, 
with a limit of 7 guesses per game. The game should play like this:

=end

class GuessingGame
  MIN_NUM = 1
  MAX_NUM = 100
  GUESS_LIMIT = 7

  attr_accessor :mystery_num, :n_guess_left, :user_number

  def initialize
    @mystery_num = nil
    @user_number = nil
  end

  def display_number_of_guesses_left(n_guess_left)
    guess_or_guesses = (n_guess_left > 1 ?  "guesses" : "guess")
    puts "You have #{n_guess_left} #{guess_or_guesses} left."
  end

  def prompt_user_for_number
    num = nil
    loop do
      puts "Enter a number between #{MIN_NUM} and #{MAX_NUM}:"
      num = gets.chomp.to_i # improvement: check for non-numerical input
      if num < MIN_NUM || num > MAX_NUM
        puts "Invalid guess"
      end
      break if (MIN_NUM..MAX_NUM).include?(num)

    end
    self.user_number = num
  end

  def display_winning_msg
    puts "You got it right, the mystery number is #{mystery_num}!"
    puts "You won!"
    puts ""
  end

  def display_too_high_or_too_low
    puts "Your guess is too low" if user_number < mystery_num
    puts "Your guess is too high" if user_number > mystery_num
    puts ""
  end

  def play
    self.mystery_num = rand(MIN_NUM..MAX_NUM)
    GUESS_LIMIT.downto(1) do |n_guess_left|
      display_number_of_guesses_left(n_guess_left)
      prompt_user_for_number
      if user_number == mystery_num
        display_winning_msg
        break
      else
        display_too_high_or_too_low
      end
      puts "You have no more guesses. I'm sorry, you lost!" if n_guess_left == 1
    end
  end

end

game = GuessingGame.new
game.play
game.play

# Player -> choose_number
# Computer -> pick_mystery_number
# GuessingGame -> compare_user_vs_mystery_number, display functions