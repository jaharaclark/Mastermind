require 'minitest/autorun'
require 'minitest/pride'
require './lib/globe'
require './lib/board'
require './lib/turn'

class TurnTest < Minitest::Test
  def test_it_exists 
    globe_1 = Globe.new('b')
    globe_2 = Globe.new('g')
    globe_3 = Globe.new('r')
    globe_4 = Globe.new('y')
    globes_A = [globe_1, globe_2, globe_3, globe_4]
    globes_B = [globe_4, globe_3, globe_2, globe_1]
    secret_code = Board.new(globes_A)
    user_code = Board.new(globes_B)
    turn = Turn.new(secret_code, user_code)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    globe_1 = Globe.new('b')
    globe_2 = Globe.new('g')
    globe_3 = Globe.new('r')
    globe_4 = Globe.new('y')
    globes_A = [globe_1, globe_2, globe_3, globe_4]
    globes_B = [globe_4, globe_3, globe_2, globe_1]
    secret_code = Board.new(globes_A)
    user_code = Board.new(globes_B)
    turn = Turn.new(secret_code, user_code)

    assert_equal secret_code, turn.secret_code
    assert_equal user_code, turn.user_code
  end
  
  # def test_it_can_return_codes

  # end

  def test_has_won_is_false_by_default
    globe_1 = Globe.new('b')
    globe_2 = Globe.new('g')
    globe_3 = Globe.new('r')
    globe_4 = Globe.new('y')
    globes_A = [globe_1, globe_2, globe_3, globe_4]
    globes_B = [globe_4, globe_3, globe_2, globe_1]
    secret_code = Board.new(globes_A)
    user_code = Board.new(globes_B)
    turn = Turn.new(secret_code, user_code)
    
    # require 'pry'; binding.pry
    assert_equal false, turn.has_won?
  end
end
