require_relative 'robot'
require_relative 'command'

class Commander
  attr_reader :robot

  def initialize(robot:)
    @robot = robot
  end

  def command(command_type:, data: nil)
    command = construct_command_object(command_type: command_type, data: data)
    @robot.execute(command: command)
  end

  private

  def construct_command_object(command_type:, data: nil)
    x, y, direction = nil
    x, y, direction = data.split(',') unless data.nil?
    Command.new(type: command_type, x_pos: x, y_pos: y, direction: direction)
  end
end
