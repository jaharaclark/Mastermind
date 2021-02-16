class Code
   attr_reader :secret_code

  def generate_easy_code
    code_to_break = []
    colors = ['b', 'g', 'r', 'y']
      4.times do
        code_to_break << colors.shuffle
      end
    @secret_code = code_to_break.flatten.shuffle[0..3]
    puts @secret_code.inspect
    return @secret_code
  end

  def generate_medium_code
    code_to_break = []
    colors = ['b', 'g', 'r', 'y', 'o']
      6.times do
        code_to_break << colors.shuffle
      end
    @secret_code = code_to_break.flatten.shuffle[0..5]
    puts @secret_code.inspect
    return @secret_code
  end

  def generate_hard_code
    code_to_break = []
    colors = ['b', 'g', 'r', 'y', 'o', 'w']
      8.times do
        code_to_break << colors.shuffle
      end
    @secret_code = code_to_break.flatten.shuffle[0..7]
    puts @secret_code.inspect
    return @secret_code
  end
end