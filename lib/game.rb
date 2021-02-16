require './lib/code'

class Game
  attr_reader :user_guess,
              :secret_code,
              :exact_counter,
              :near_counter,
              :copy_of_secret_code,
              :turn_counter,
              :difficulty_choice,
              :start_time,
              :total_time,
              :code


  def initialize
    @exact_counter = 0
    @near_counter = 0
    @turn_counter = 0
    @start_time = Time.now
    @code = Code.new
  end
  

  def get_user_difficulty_choice
    puts "Choose your level of difficulty: (e)asy, (m)edium or (h)ard."
    @difficulty_choice = gets.chomp
    set_difficulty
  end

  def set_difficulty
    case difficulty_choice
    when 'e', 'easy'
      @code.generate_easy_code
    when 'm', 'medium'
      @code.generate_medium_code
    when 'h', 'hard'
      @code.generate_hard_code
    else 
      puts "I didn't understand your selection, please try again."
      get_user_difficulty_choice
    end
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
    @end_time = Time.now
    @total_time = @end_time.to_i - @start_time.to_i
    minutes = @total_time / 60
    seconds = @total_time % 60
    puts "Your total time is #{minutes.round(2)} minutes and #{seconds.round(2)} seconds. \nYou took a total of #{@turn_counter} guess(es)."
  end

  def end_game
    end_time
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
      get_user_difficulty_choice
      explain_colors
      start_time
    end
    query_user_guess
  end

  def explain_colors
    case @difficulty_choice
    when 'e', 'easy'
      puts "I have generated a sequence with four elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow. Please enter guesses of four total colors in the form of 'XXXX'. Use (q) at any time to end the game."
    when 'm', 'medium'
      puts "I have generated a sequence with five elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range. Please enter guesses of six total colors in the form of 'XXXXXX'. Use (q) at any time to end the game."
    when 'h', 'hard'
      puts "I have generated a sequence with six elements made up of: (r)ed, (g)reen, (b)lue, (y)ellow, (o)range, (w)hite. Please enter guesses of eight total colors in the form of 'XXXXXXXX'. Use (q) at any time to end the game."
    end
  end

  def query_user_guess
    puts "What's your guess?"
    @user_guess = gets.chomp.split("")

    validate_guess
  end

  def validate_guess
    check_for_quit_or_cheat
    check_length
  end

  def check_for_quit_or_cheat
     if @user_guess == ['q'] || @user_guess == ["q", "u", "i", "t"]
      end_game
    elsif @user_guess == ['c'] || @user_guess == ["c", "h", "e", "a", "t"]
      puts "secret code: #{code.secret_code}"
      end_game
    end
  end
  
  def check_length
    if @user_guess.length == @code.secret_code.length
      check_exact_match
    else
      puts "Your guess is invalid. Please try again."
      query_user_guess
    end
  end

  # def check_exact_match
  #   @user_guess.each_with_index do |char, index|
  #     if char == @code.secret_code[index]
  #       @exact_counter += 1
  #     end
  #   end
  #   if @exact_counter == 4 || @exact_counter == 6 || @exact_counter == 8
  #     end_game
  #   else
  #     check_near_match
  #   end
  # end

  # def check_near_match
  #   copy_of_secret_code = @code.secret_code.dup  
  #   @user_guess.each do |color|
  #     if copy_of_secret_code.include?(color)
  #       @near_counter += 1
  #       copy_of_secret_code.delete_at(copy_of_secret_code.index(color))
  #     end
  #   end
  #   @turn_counter += 1
  #   puts "#{@user_guess} has #{@near_counter} of the correct elements with #{@exact_counter} in the correct positions. You've taken #{@turn_counter} guess(es)."
  #   reset_counters
  # end

  def reset_counters
    @exact_counter = 0
    @near_counter = 0
  end
end
