require 'minitest/autorun'
require 'minitest/pride'
require './lib/globe.rb'

class GlobeTest < Minitest::Test
  def setup
    @globe_1 = Globe.new('b')
    @globe_2 = Globe.new('g')
  end

  def test_it_exists
    assert_instance_of Globe, @globe_1
  end

  def test_it_has_attributes
    assert_equal 'b', @globe_1.color
  end

  def test_it_can_have_different_attributes
    assert_equal 'g', @globe_2.color
  end
end
