require 'minitest/autorun'
require 'minitest/pride'
require './lib/code'

class CodeTest < Minitest::Test
  def setup
    @code = Code.new
  end

  def test_it_exists
    assert_instance_of Code, @code
  end

  def test_it_can_generate_easy_code
    assert_equal 4, @code.generate_easy_code.length
  end

  def test_it_can_generate_medium_code
    assert_equal 6, @code.generate_medium_code.length
  end

   def test_it_can_generate_hard_code
    assert_equal 8, @code.generate_hard_code.length
  end
end