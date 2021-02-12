class Game
    attr_reader :board,
                :globe,
                :turn,
  def initialize
    @board = Board.new
    @globe = Globe.new
    @turn = Turn.new
  end

  def start_game
    puts "Welcome to MASTERMIND \n" +
    "Would you like to (p)lay, read the (i)nstructions or (q)uit?"

    user_selection = gets.chomp.upcase

    if user_selection == "P" || user_selection == "PLAY"
      play
    elsif user_selection == "I" || user_selection == "INSTRUCTIONS" || user_selection == "READ INSTRUCTIONS"
      read
    elsif user_selection == "Q" || user_selection == "QUIT"
      quit
    else
      puts "I didn't understand your selection. Will you please try again?"
    end
  end

def play
  puts "PLAYYYY"
end

def read
  puts "READDDD"
end

def quit
  puts "ENDEEE"
end

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
