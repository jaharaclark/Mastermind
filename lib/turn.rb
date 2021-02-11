class Turn
  attr_reader :secret_code,
              :user_code,
              :exact_counter,
              :near_counter
  attr_accessor :has_won

  def initialize(secret_code, user_code)
    @secret_code = secret_code
    @user_code = user_code
    @exact_counter = 0
    @near_counter = 0
    @has_won = false
  end

  def has_won?
    @has_won
  end

  # def player_guess/guess/user_guess/whatever
  # input = gets.chomp.downcase
  # if input.length > 4
  # puts "Please enter a valid code of 4 colors"
  # else push to user_code array??

 #having trouble deciding what goes in game and what goes in turn.
 # check win lose conditions -> guess -> check guess against secret code -> output near/exact matches
 # -> ask for input -> repeat


end
