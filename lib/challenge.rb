require './lib/turn'
require './lib/globe'
require './lib/board'

class Game
  attr_reader :user_guess,
              :secret_code,
              :exact_counter,
              :near_counter,
              :copy_of_secret_code,
              :turn_counter

  def initialize
    @secret_code ||= generate_secret_code
    @exact_counter = 0
    @near_counter = 0
    @turn_counter = 0
  end

  def generate_secret_code
    code_to_break = []
    colors = ['b', 'g', 'r', 'y']
      4.times do
        code_to_break << colors.shuffle
      end
    return code_to_break.flatten.shuffle[0..3]
  end

  def start_game
    puts "Welcome to MASTERMIND \nWould you like to (p)lay, read the (i)nstructions or (q)uit?"

    input = gets.chomp

    until input == 'q' || input == 'quit' do
     do_something(input)
    end
      end_game
  end

  def start_time
    @start_time
  end

  def end_time
  end

  def end_game
    puts "That's All Folks."
    exit!
  end

  def do_something(input)
    case input

    when 'p', 'play'
      play
    when 'i', 'information'
      puts "Info, info, info."
      start_game
    else
      puts "Give me p or i or q. That's it."
      start_game
    end
  end

  def play
    if @turn_counter == 0
      explain_colors
      query_user_guess
    else
      query_user_guess
    end
  end

  def explain_colors
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Use (q) at any time to end the game."
  end

  def query_user_guess
    puts "What's your guess?"
    @user_guess = gets.chomp.split("")

    validate_guess
  end

  def validate_guess
    if @user_guess == ['q'] || @user_guess == ["q", "u", "i", "t"]
      end_game
    elsif @user_guess == ['c'] || @user_guess == ["c", "h", "e", "a", "t"]
      puts "secret code: #{@secret_code}"
      start_game
    else
      check_length
    end
  end

  def check_length
    if @user_guess.length > 4
      puts "Your guess is too long. Please try again."
      query_user_guess
    elsif @user_guess.length < 4
      puts "Your guess is too short. Please try again."
      query_user_guess
    else
      check_exact_match
    end
  end

  def check_exact_match
    # exact_counter_reset
    @user_guess.each_with_index do |char, index|
      if char == @secret_code[index]
        @exact_counter += 1
      end
    end
    if @exact_counter == 4
      end_game
    else
      check_near_match
    end
  end

  def check_near_match
    copy_of_secret_code = @secret_code.dup  #This is the crux of the issue right here.

    @user_guess.each do |color|
      if copy_of_secret_code.include?(color)
        @near_counter += 1
        copy_of_secret_code.delete_at(copy_of_secret_code.index(color))
      end
    end
    @turn_counter += 1
    puts "#{@user_guess} has #{@near_counter} of the correct elements with #{@exact_counter} in the correct positions. You've taken #{@turn_counter} guess(es)."
    near_counter_reset
    exact_counter_reset

  end

  def near_counter_reset
    @near_counter = 0
  end

  def exact_counter_reset
    @exact_counter = 0
  end
end


# reference to line 108: so some basic types of object in ruby are passed "by value",
# meaning that if you run x = 123 then y = x, x and y will point to physically different addresses in your computer's memory
# the value for x will occupy one space, and the value for y will occupy another
# this is the case for true, false, nil, numbers, and symbols (symbols look like this: :symbol)
# but for all other types of object, they're passed "by reference",
# meaning that if you run x = [1, 2, 3] then y = x, x and y will point to the same address in memory
# so modifying that array by calling x.delete_at(…) is the same as modifying that array by calling y.delete_at(…)
