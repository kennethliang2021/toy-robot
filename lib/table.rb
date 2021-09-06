NUM_OF_COLUMNS = 5
NUM_OF_ROWS = 5

class Table
  def in_bounds?(row:, column:)
    row_max = NUM_OF_COLUMNS - 1
    column_max = NUM_OF_ROWS - 1
    (0..row_max).include?(row) && (0..column_max).include?(column)
  end
end
