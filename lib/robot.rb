require_relative './position'
require_relative './direction'

class Robot
  attr_accessor :table, :direction, :position

  def initialize(table)
    @table = table
  end

  def heard(input)
    begin
      command, params = input.downcase.split(/\s/, 2)
      if !params.nil?
        params = params.split(/\s*,\s*/)
      end

      if respond_to?(command)
        send(command, *params)
      end
    rescue Exception => e

    end
  end

  def place(x, y, f)
    new_position = Position.new(x, y)
    new_direction = Direction.new(f)

    if new_direction.is_valid? && new_position.is_valid? && @table.is_placeable?(new_position)
      @position = new_position
      @direction = new_direction
    end
  end

  def move
    if can_move?
      new_position = @direction.move(@position)
      if @table.is_placeable?(new_position)
        @position = new_position
      end
    end
  end

  def left
    if can_move?
      @direction.left
    end
  end

  def right
    if can_move?
      @direction.right
    end
  end

  def report
    if can_move?
      puts "#{@position}, #{@direction}"
    end
  end

  private

  def can_move?
    !@direction.nil? && !@position.nil?
  end
end