
class GuessingGame
  attr_reader :range, :guess_limit
  attr_accessor :mystery_num, :user_number

  def initialize(min_num, max_num)
    @range = min_num..max_num
    @mystery_num = nil
    @user_number = nil
    @guess_limit = Math.log2(max_num - min_num + 1).to_i + 1
  end

  def display_number_of_guesses_left(n)
    guess_or_guesses = (n > 1 ?  "guesses" : "guess")
    puts "You have #{n} #{guess_or_guesses} left."
  end

  def prompt_user_for_number
    num = nil
    loop do
      puts "Enter a number between #{range.min} and #{range.max}:"
      num = gets.chomp.to_i # improvement: check for non-numerical input
      if num < range.min || num > range.max
        puts "Invalid guess"
      end
      break if range.include?(num)

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
    self.mystery_num = rand(range)

    guess_limit.downto(1) do |n|
      display_number_of_guesses_left(n)
      prompt_user_for_number
      if user_number == mystery_num
        display_winning_msg
        break
      else
        display_too_high_or_too_low
      end
      puts "You have no more guesses. I'm sorry, you lost!" if n == 1
    end
  end

end

game = GuessingGame.new(501, 1500)
game.play
game.play

# interesting modules from student solutions: Displayable, Interface