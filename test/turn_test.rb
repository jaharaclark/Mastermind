require 'minitest/autorun'
require 'minitest/pride'
require './lib/turn'

class Test < Minitest::Test
  def setup
    @user_guess_easy = ['r', 'y', 'g', 'y']
    @secret_code_easy = ['b', 'y', 'g', 'r']
    @turn_easy = Turn.new(@user_guess_easy, @secret_code_easy)
    @user_guess_medium = ['r', 'y', 'g', 'y', 'o', 'g']
    @secret_code_medium = ['b', 'y', 'g', 'r', 'b', 'g']
    @turn_medium = Turn.new(@user_guess_medium, @secret_code_medium)
    @user_guess_hard = ['r', 'y', 'g', 'y', 'o', 'g', 'r', 'w']
    @secret_code_hard = ['b', 'y', 'g', 'r', 'b', 'g', 'w', 'y']
    @turn_hard = Turn.new(@user_guess_hard, @secret_code_hard)
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
    @turn_easy.reset_near_counter
    @turn_easy.reset_exact_counter

    assert_equal 0, @turn_easy.near_counter
    assert_equal 0, @turn_easy.exact_counter
  end

  def test_it_can_check_easy_exact_match
    @turn_easy.check_exact_match

    assert_equal 2, @turn_easy.exact_counter
  end

  def test_it_can_check_easy_near_match
    @turn_easy.check_near_match

    assert_equal 3, @turn_easy.near_counter
  end

  def test_it_can_check_medium_exact_match
    @turn_medium.check_exact_match

    assert_equal 3, @turn_medium.exact_counter
  end

  def test_it_can_check_medium_near_match
    @turn_medium.check_near_match

    assert_equal 4, @turn_medium.near_counter
  end

  def test_it_can_check_hard_exact_match
    @turn_hard.check_exact_match

    assert_equal 3, @turn_hard.exact_counter
  end

  def test_it_can_check_hard_near_match
    @turn_hard.check_near_match

    assert_equal 6, @turn_hard.near_counter
  end
end
