require 'pry'
require 'minitest/autorun'
require_relative '../lib/robot'
require_relative '../lib/table'

class TableTest < Minitest::Test
  def setup
    @table = Table.new
  end

  def test_with_valid_location_values_one
    assert @table.in_bounds?(row: 0, column: 0)
  end

  def test_with_valid_location_values_two
    assert @table.in_bounds?(row: 4, column: 0)
  end

  def test_with_valid_location_values_three
    assert @table.in_bounds?(row: 0, column: 4)
  end

  def test_with_valid_location_values_four
    assert @table.in_bounds?(row: 4, column: 4)
  end

  def test_with_invalid_location_values_one
    refute @table.in_bounds?(row: 5, column: 0)
  end

  def test_with_invalid_location_values_two
    refute @table.in_bounds?(row: 0, column: 5)
  end

  def test_with_invalid_location_values_three
    refute @table.in_bounds?(row: -1, column: -0)
  end

  def test_with_invalid_location_values_four
    refute @table.in_bounds?(row: 0, column: -1)
  end
end
