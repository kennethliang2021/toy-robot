require 'pry'
require 'minitest/autorun'
require_relative '../lib/compass'

class CompassTest < Minitest::Test
  def setup
    @compass = Compass.new
  end

  def test_ninety_degrees_left
    result = @compass.ninety_degrees_left(direction: :north)
    assert_equal :west, result
  end

  def test_ninety_degrees_right
    result = @compass.ninety_degrees_right(direction: :north)
    assert_equal :east, result
  end
end
