class Table
  attr_accessor :table_size

  def initialize(table_size = 5)
    @table_size = table_size - 1
  end

  def is_placeable?(position)
    ((0..@table_size) === position.x) && ((0..@table_size) === position.y)
  end
end