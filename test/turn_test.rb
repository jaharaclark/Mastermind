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

  def test_it_can_reset_near_and_exact_counter
    @turn_easy.reset_counters
    
    assert_equal 0, @turn_easy.near_counter
    assert_equal 0, @turn_easy.exact_counter
  end

  def test_it_can_check_easy_match
    @turn_easy.check_exact_match
    
    require 'pry'; binding.pry
    assert_equal 2, @turn_easy.exact_counter
  end

end