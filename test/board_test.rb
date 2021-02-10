require 'minitest/autorun'
require 'minitest/pride'
require './lib/board'
require './lib/globe'

class BoardTest < Minitest::Test

  def setup
    @globe_1 = Globe.new('b')
    @board = Board.new(@globe_1, 3)
  end

  def test_it_exists
    assert_instance_of Board, @board
  end

  # def test_it_has_attributes
  # end
  #
  # def test_it_can_have_different_attributes
  # end
end
