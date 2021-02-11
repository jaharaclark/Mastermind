@game_globes = []

def make_secret(player_selection)
colors = ['b', 'g', 'r', 'y']
counter = 0
  player_selection.times do
    until counter == player_selection
      @game_globes.push(colors[0], colors[1], colors[2], colors[3])
      counter += 1
    end
  end
  print @game_globes
end

make_secret(4)

@game_globes.shuffle!
puts "   "   
print @game_globes

@secret_code = @game_globes[0..3]
puts "   "
print "secret code: #{@secret_code}"

# print @secret_code
# @secret_code = ["b", "g", "y", "r"]

# print @secret_code
puts "   "
@user_code = ['b', 'y', 'r', 'r']
print "user_code:   #{@user_code}"
@exact_match = 0
@near_match = 0

def check_code
  @secret_code.each_with_index do |ball, index|
    @user_code.each_with_index do |other_ball, other_index|
      if ball == other_ball && index == other_index
        @exact_match += 1
      # elsif ball == other_ball && index != other_index
      #   @near_match += 1 
      end
      if ball == other_ball
        puts "YESS"
      end
    end
  end


puts "  "
puts  "exact match: #{@exact_match}"
puts "near match MAYBE: #{@near_match - @exact_match}"
puts "near match: #{@near_match}"
end

check_code

# @counterAGAIN = 0
# def near_check
#   # until @counterAGAIN = @user_code.length
#     if @secret_code.include?('y')
#       puts "HIIII HAPPY TUESDAY"
#       # @counterAGAIN +=1
#     # end
#   end
# end

# near_check