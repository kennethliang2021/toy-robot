require 'pry'
require 'minitest/autorun'
require_relative '../lib/robot'
require_relative '../lib/table'
require_relative '../lib/command'

class RobotTest < Minitest::Test
  def setup
    @table = Table.new
    @robot = Robot.new(position_x: 0, position_y: 0, facing_direction: :north, table: @table)
  end

  def test_move
    command = Command.new(type: :move)
    @robot.execute(command: command)
    assert_equal '0,1,NORTH', @robot.report
  end

  def test_place
    command = Command.new(type: :place, x_pos: 0, y_pos: 4, direction: :east)
    @robot.execute(command: command)
    assert_equal '0,4,EAST', @robot.report
  end

  def test_turn_left
    command = Command.new(type: :left)
    @robot.execute(command: command)
    assert_equal '0,0,WEST', @robot.report
  end

  def test_turn_right
    command = Command.new(type: :right)
    @robot.execute(command: command)
    assert_equal '0,0,EAST', @robot.report
  end

  def test_turn_left_and_move
    command = Command.new(type: :left)
    @robot.execute(command: command)
    command = Command.new(type: :move)
    @robot.execute(command: command)
    assert_equal '0,0,WEST', @robot.report
  end

  def test_turn_right_and_move
    command = Command.new(type: :right)
    @robot.execute(command: command)
    command = Command.new(type: :move)
    @robot.execute(command: command)
    assert_equal '1,0,EAST', @robot.report
  end

  def test_out_of_bounds_value
    command = Command.new(type: :place, x_pos: 0, y_pos: 4, direction: :north)
    @robot.execute(command: command)
    command = Command.new(type: :move)
    @robot.execute(command: command)
    assert_equal '0,4,NORTH', @robot.report
  end
end
