class Command
  attr_accessor :type, :x_pos, :y_pos, :direction

  def initialize(type:, x_pos: nil, y_pos: nil, direction: nil)
    @type = type
    @x_pos = x_pos&.to_i
    @y_pos = y_pos&.to_i
    @direction = direction&.to_sym
  end

  def values
    [type, x_pos, y_pos, direction]
  end
end
