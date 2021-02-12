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

  def check_code(key, guess)
    key.globes.each_with_index do |ball, index|
      guess.globes.each_with_index do |other_ball, other_index|
        if ball == other_ball && index == other_index
        @exact_counter += 1
      end
      end
    end
    @exact_counter
  end


  def near_check(key, guess)
    copy_of_secret_code = key
    guess.globes.each do |color|
      if copy_of_secret_code.globes.include?(color)
          @near_counter += 1
          copy_of_secret_code.globes.delete_at(copy_of_secret_code.globes.index(color))
      end
    end
    result = @near_counter - @exact_counter
  end
end
