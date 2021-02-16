class Turn
  attr_reader :user_guess, 
              :secret_code, 
              :turn_counter, 
              :near_counter, 
              :exact_counter

  def initialize(user_guess, secret_code)
    @user_guess = user_guess
    @secret_code = secret_code
    @turn_counter = 0
    @near_counter = 0
    @exact_counter = 0
  end

  def near_counter_reset
    near_counter = 0
  end

  def exact_counter_reset
    exact_counter = 0
  end

  def check_exact_match
    @turn_counter += 1
    exact_counter_reset
    @user_guess.each_with_index do |char, index|
      if char == @secret_code[index]
        @exact_counter += 1
      end
    end
    if @exact_counter == 4 || @exact_counter == 6 || @exact_counter == 8
       "Congratulate Winner"
    else
      check_near_match
    end
  end

  def check_near_match
    copy_of_secret_code = @secret_code.dup  
    near_counter_reset
    @user_guess.each do |color|
      if copy_of_secret_code.include?(color)
        @near_counter += 1
        copy_of_secret_code.delete_at(copy_of_secret_code.index(color))
      end
    end
    puts "#{@user_guess} has #{@near_counter} of the correct elements with #{@exact_counter} in the correct positions. You've taken #{@turn_counter} guess(es)."
  end

end