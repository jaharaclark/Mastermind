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
    board_comp = Board.new(globes_A)
    board_user = Board.new(globes_B)
    turn = Turn.new(board_comp, board_user)

    assert_instance_of Turn, turn
  end

  def test_it_has_attributes
    globe_1 = Globe.new('b')
    globe_2 = Globe.new('g')
    globe_3 = Globe.new('r')
    globe_4 = Globe.new('y')
    globes_A = [globe_1, globe_2, globe_3, globe_4]
    globes_B = [globe_4, globe_3, globe_2, globe_1]
    board_comp = Board.new(globes_A)
    board_user = Board.new(globes_B)
    turn = Turn.new(board_comp, board_user)

    assert_equal board_comp, turn.board_comp
    assert_equal board_user, turn.board_user
  end
  
end
