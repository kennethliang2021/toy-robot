DIRECTIONS = %i[north east south west].freeze

class Compass


  def valid_direction?(direction:)
    DIRECTIONS.include?(direction)
  end

  def ninety_degrees_left(direction:)
    index = direction_index(direction: direction) - 1
    direction(index: index)
  end

  def ninety_degrees_right(direction:)
    index = direction_index(direction: direction) + 1
    direction(index: index)
  end

  private

  def direction(index:)
    DIRECTIONS[index % 4]
  end

  def direction_index(direction:)
    DIRECTIONS.find_index(direction)
  end
end
