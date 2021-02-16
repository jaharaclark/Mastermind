require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'

class GameTest < Minitest::Test
  def setup
    @game = Game.new
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Game, @game
    assert_equal 0, @game.turn_counter
    assert_equal true, @game.beginning_of_game
    assert_equal [], @game.history
  end  
end