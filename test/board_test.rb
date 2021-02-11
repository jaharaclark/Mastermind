require 'minitest/autorun'
require 'minitest/pride'
require './lib/globe'
require './lib/board'

class BoardTest < Minitest::Test

  def setup
    @globe_1 = Globe.new('b')
    @globe_2 = Globe.new('g')
    @globe_3 = Globe.new('r')
    @globe_4 = Globe.new('y')
    @globes = [@globe_1, @globe_2, @globe_3, @globe_4]
    @board = Board.new(@globes)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  def test_it_has_attributes
    assert_equal @globes, @board.globes
  end
end
