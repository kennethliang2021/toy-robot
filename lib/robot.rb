require_relative 'table'
require_relative 'compass'
require 'pry'

COMMANDS = %i[place move left right report]

class Robot
  attr_reader :facing_direction, :position_x, :position_y, :table, :compass

  def initialize(table:, position_x: nil, position_y: nil, facing_direction: nil)
    @table = table
    @compass = Compass.new
    @position_x = position_x
    @position_y = position_y
    @facing_direction = facing_direction
  end

  def execute(command:)
      case command.type
      when :place
        if valid_place_command?(command: command)
          place(x_pos: command.x, y_pos: command.y, direction: command.direction)
        end
      else
        if valid_command_type?(command_type: command.type)
          send(command.type)
        end
      end
  end

  def report
    puts "#{@position_x},#{@position_y},#{@facing_direction&.upcase}"
    "#{@position_x},#{@position_y},#{@facing_direction&.upcase}"
  end

  def valid_place_command?(command:)
    _command_type, x, y, direction = command.values
    valid_placement?(x_pos: x, y_pos: y, direction: direction)
  end

  private

  def place(x_pos: nil, y_pos: nil, direction: nil)
    @position_x = x_pos
    @position_y = y_pos
    @facing_direction = direction
  end

  def move
    desire_position_x, desire_position_y = calculate_move
    return unless movable?(x_pos: desire_position_x, y_pos: desire_position_y)

    @position_x = desire_position_x
    @position_y = desire_position_y
  end

  def left
    result = @compass.ninety_degrees_left(direction: @facing_direction)
    @facing_direction = result
  end

  def right
    result = @compass.ninety_degrees_right(direction: @facing_direction)
    @facing_direction = result
  end

  def valid_placement?(x_pos:, y_pos:, direction:)
    movable?(x_pos: x_pos, y_pos: y_pos) && @compass.valid_direction?(direction: direction)
  end

  def valid_command_type?(command_type:)
    COMMANDS.include?(command_type)
  end

  def movable?(x_pos:, y_pos:)
    @table.in_bounds?(row: x_pos, column: y_pos)
  end

  def calculate_move
    case @facing_direction
    when :north  then [@position_x, @position_y + 1]
    when :east   then [@position_x + 1, @position_y]
    when :south  then [@position_x, @position_y - 1]
    when :west   then [@position_x - 1, @position_y]
    end
  end
end
