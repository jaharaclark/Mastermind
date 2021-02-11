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
end
