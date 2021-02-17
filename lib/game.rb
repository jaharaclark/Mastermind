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
              :beginning_of_game,
              :history,
              :minutes,
              :seconds


  def initialize
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
     capture_user_choice(input)
    end
    end_game
  end

  def capture_user_choice(input)
    case input
    when 'p', 'play'
      play
    when 'i', 'instructions'
      puts "----------MASTERMIND INSTRUCTIONS----------\nMastermind is a codebreaking game designed for a single player to crack the computer's code. Upon choosing to (p)lay the game, the player decides on the complexity of the code they will attempt to break: easy yields a four character code containing four colors that may be repeated, medium yields a six character code containing five colors, at least one of which will be repeated and hard yields an eight character code containing six colors, at least one of which will be repeated. \n\nOnce the player has chosen their level of difficulty, the computer asks the user for their guess, which they will enter in as a single line of characters in either lower or uppercase (xxxx or XXXXXX). The computer will check the player's guess against it's secret code. \n\nIn the event that they player correctly guesses the code, the computer will congratulate the player, displaying the code, the number of guesses the player made and the elapsed time. In the event the player is incorrect,  the computer will inform the player of the number of correct characters they guessed and how many are in the correct positions, respectively. At any time, the player may ask for the his(t)ory, revealing a complete list of the player's previous guesses.\n\nThe game continues until either the player wins, the player enters (c)heat, causing the computer to display the secret code, or the player gives up and quits the game altogether.\n----------END OF INSTRUCTIONS----------"
      start_game
    else
      puts "You've made an invalid selection. Please either (p)lay, read the (i)nstructions or (q)uit."
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
    if check_for_quit_or_cheat != "Break Please"
      check_length
    end
  end
  
  # def validate_guess
  #   check_for_quit_or_cheat
  #   check_length
  # end
  
  def check_for_quit_or_cheat
    if @user_guess == ["q"] || @user_guess == ["q", "u", "i", "t"]
      end_game
    elsif @user_guess == ["c"] || @user_guess == ["c", "h", "e", "a", "t"]
      puts "secret code: #{code.secret_code}"
      end_game
    elsif @user_guess == ["t"] || @user_guess == ["h","i","s","t","o","r","y"]
      puts "----------PLAYER GUESS HISTORY----------"
      @history.each do |guess|
        puts guess
      end
      puts "----------END OF HISTORY----------"
      query_user_guess
      "Break Please"
    end
  end
  
  def check_length
    if @user_guess.length == @code.secret_code.length
      @turn = Turn.new(@user_guess,@code.secret_code)
      turn_result = @turn.check_exact_match
      @turn_counter += 1
      if @turn_counter == 1
        puts "You've taken 1 guess."
      else
        puts "You've taken #{@turn_counter} guesses."
      end
      if turn_result == "Congratulate Winner"
        congratulate_winner
      end
    else
      puts "Your guess is invalid. Please try again."
      query_user_guess
    end
  end
  
  def start_time
    @start_time
  end
  
  def end_time
    @end_time = Time.now
    @total_time = @end_time.to_i - @start_time.to_i
    @minutes = @total_time / 60
    @seconds = @total_time % 60
    puts "----------GAME REPORT----------\nCongratulations! You've guessed the sequence #{@code.secret_code} in #{@turn_counter} guesses over  #{minutes.round(2)} minutes, #{seconds.round(2)} seconds."
  end
  
  def congratulate_winner
    end_time
    @turn_counter = 0
    puts "Do you want to (p)lay again or (q)uit?"
    
    user_request = gets.chomp
    
    if user_request == "q" || user_request == "quit"
      end_game
    elsif user_request == "p" || user_request == "play"
      get_user_difficulty_choice
    else 
      puts "You've entered an invalid selection. Please restart the game to play again."
      exit!
    end
  end

  def end_game
    puts "Thanks for playing!"
    exit!
  end
end
