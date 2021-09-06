class Command 
  attr_accessor :type, :x, :y, :direction

  def initialize(type:, x: nil, y: nil, direction: nil)
    @type = type
    @x = x&.to_i
    @y = y&.to_i
    @direction = direction&.to_sym
  end

  def values
    [type, x, y, direction]
  end


end