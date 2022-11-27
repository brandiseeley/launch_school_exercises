require 'pry-byebug'
class GuessingGame
  attr_reader :user, :range, :low, :high
  def initialize(low=1, high=100)
    @user = User.new
    @secret_number = nil
    @low = low
    @high = high
    @range = (low..high)
    @guesses = Math.log2(high-low).to_i + 1
  end
  
  def play
    # binding.pry
    @secret_number = range.to_a.sample
    won = false
    display_welcome
    (1..@guesses).reverse_each do |trys_left|
      puts "You have #{trys_left} guesses remaining."
      guess = user.make_guess(low, high)
      if winning_guess?(guess)
        display_winning_message
        won = true
        break
      end
      display_high_or_low(guess)
    end
    puts 'You have no more guesses. You lost!' unless won
  end

  def display_welcome
    puts 'Welcome to the Number Guessing Game!'
  end


  def display_high_or_low(guess)
    if guess > @secret_number
      puts "Your guess is too high.\n\n"
    else
      puts "Your guess is too low.\n\n"
    end
  end

  def display_winning_message
    puts "That's the number!\n\nYou won!"
  end

  def winning_guess?(guess)
    @secret_number == guess
  end
end

class User
  def make_guess(low, high)
    input = nil
    loop do
      puts "Enter a number between #{low} and #{high}:"
      input = gets.chomp
      break if input.to_i.to_s == input && (low..high).cover?(input.to_i)
      puts 'Invalid guess.'
    end
    input.to_i
  end
end

game = GuessingGame.new(1, 1000)
game.play
