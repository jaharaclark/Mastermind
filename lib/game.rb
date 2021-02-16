require './lib/code'
require './lib/turn'

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
              :code,
              :beginning_of_game
              :history


  def initialize
    @exact_counter = 0
    @near_counter = 0
    @turn_counter = 0
    @start_time = Time.now
    @code = Code.new
    @beginning_of_game = true
    @history = []
  end


  def get_user_difficulty_choice
    puts "Choose your level of difficulty: (e)asy, (m)edium or (h)ard."
    @difficulty_choice = gets.chomp.downcase
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

    input = gets.chomp.downcase

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
    puts "Your total time is #{minutes.round(2)} minutes and #{seconds.round(2)} seconds. \nYou took a total of #{@turn.turn_counter} guess(es)."
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
    if @beginning_of_game == true
      get_user_difficulty_choice
      explain_colors
      start_time
      @beginning_of_game = false
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
    @user_guess = gets.chomp.downcase.split("")
    if (@user_guess <=> ["t"]) != 0 && (@user_guess <=> ["h","i","s","t","o","r","y"]) != 0
      @history << @user_guess.join("")
    end

    validate_guess
  end

  def validate_guess
    check_for_quit_or_cheat
    check_length
  end

  def check_for_quit_or_cheat
     if @user_guess == ["q"] || @user_guess == ["q", "u", "i", "t"]
      end_game
    elsif @user_guess == ["c"] || @user_guess == ["c", "h", "e", "a", "t"]
      puts "secret code: #{code.secret_code}"
      end_game
    elsif @user_guess == ["t"] || @user_guess == ["h","i","s","t","o","r","y"]
      puts "Player Guess History:"
      @history.each do |guess|
        puts guess
      end
    query_user_guess
    end
  end

  def check_length
    if @user_guess.length == @code.secret_code.length
      @turn = Turn.new(@user_guess,@code.secret_code)
      turn_result = @turn.check_exact_match
      if turn_result == "Congratulate Winner"
        congratulate_winner
        end_game
      end
    else
      puts "Your guess is invalid. Please try again."
      query_user_guess
    end
  end
end

  def congratulate_winner
    puts "You cracked the secret code!"
  end

end
