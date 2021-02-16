require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class Test < Minitest::Test
  def setup
    @user_guess_easy = ['r', 'y', 'g', 'y']
    @secret_code_easy = ['b', 'y', 'g', 'r']
    @turn_easy = Turn.new(@user_guess_easy, @secret_code_easy)
  end

  def test_it_exists_and_has_attributes
    assert_instance_of Turn, @turn_easy
    assert_equal @user_guess_easy, @turn_easy.user_guess
    assert_equal @secret_code_easy, @turn_easy.secret_code
    assert_equal 0, @turn_easy.turn_counter
    assert_equal 0, @turn_easy.near_counter
    assert_equal 0, @turn_easy.exact_counter
  end

def test_counters_reset_to_0
    assert_equal 0, @turn_easy.exact_counter_reset
    assert_equal 0, @turn_easy.near_counter_reset
  end

  def test_check_easy_exact_match
    @turn_easy.check_exact_match

    assert_equal 2, @turn_easy.exact_counter
  end

  def test_check_easy_near_match
    @turn_easy.check_exact_match

    assert_equal 3, @turn_easy.near_counter
  end  
end