class Game
    # attr_reader :board,
    #             :globe,
    #             :turn,
    #             :user_guess
  def initialize
    # @board = Board.new
    # @globe = Globe.new
    # @turn = Turn.new
    #secret code inheritss from turn
    @start_time = Time.new
    @possible_answers = ['r', 'g', 'b', 'y'].repeated_permutation(4).to_a
  end

  def start_game
    puts "Welcome to MASTERMIND \n" +
    "Would you like to (p)lay, read the (i)nstructions or (q)uit?"
    puts ">"

    user_selection = gets.chomp.upcase

    if user_selection == "P" || user_selection == "PLAY"
      play
    elsif user_selection == "I" || user_selection == "INSTRUCTIONS" || user_selection == "READ INSTRUCTIONS"
      read
    elsif user_selection == "Q" || user_selection == "QUIT"
      quit
    else
      puts "I didn't understand your selection. Will you please try again?"
      start_game
    end
  end

def play
  puts "PLAYYYY"
  puts ">"
  @user_code = gets.chomp.downcase
  if user_code == "q" || user_code == "quit"
  quit
  else
    turn = Turn.new(secet_code, user_code)
    if @user_code == "c" || @user_guess == "cheat"
      puts  "The secret code is '#{@secret_code.join()}'"
    elsif @user_code.#method for checking length
      puts "Invalid input, please ensure your guess is 4 characters and limted to the available colors"
    else
      #turn.check_code
      #turn.near_check
    end
  end
  #was it an exact match? yes - win condition statement
  #no?
  #call another turn
end
end

def read
  puts "READDDD"
  start_game
end

def quit
  puts "Goodbye!"
  exit
end





=begin
We need to:
 - greet the user (start)
 - ask the user if they want to play, read or quit (start)
 - if they want to play, get their guess (turn)
    - validate their guess
      - is it too long, too short?
    - check if they had an exact match
      - if exact match, fire end game protocol (end)
    - check if they had a near match
    - print their near match results
    - save the data in a JSON or CSV for tracking (turn)
    - prompt the user to guess again
- or take them to the instructions page (start)
- or quit the game (end)

We need 3 methods:
- start_game
- take_turn
- end_game
=end
