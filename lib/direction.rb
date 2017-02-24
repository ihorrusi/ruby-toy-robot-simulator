require_relative './position'

class Direction
  SIDES = [
      {
          :name => 'west',
          :x => -1,
          :y => 0
      },
      {
          :name => 'north',
          :x => 0,
          :y => +1
      },
      {
          :name => 'east',
          :x => +1,
          :y => 0
      },
      {
          :name => 'south',
          :x => 0,
          :y => -1
      }
  ]

  SIDES_LAST_INDEX = SIDES.length - 1

  attr_accessor :active_side_index

  def initialize(name)
    @active_side_index = SIDES.index { |side| side[:name] == name }
  end

  def is_valid?
    !@active_side_index.nil?
  end

  def move(position)
    return nil if !is_valid?
    Position.new(*[position.x + active_side[:x], position.y + active_side[:y]])
  end

  def left
    return nil if !is_valid?
    @active_side_index = @active_side_index - 1

    if (@active_side_index) < 0
      @active_side_index = SIDES_LAST_INDEX
    end
  end

  def right
    return nil if !is_valid?
    @active_side_index = @active_side_index + 1

    if @active_side_index > SIDES_LAST_INDEX
      @active_side_index = 0
    end
  end

  def to_s
    if active_side.nil?
      ''
    else
      active_side[:name].upcase
    end
  end

  private

  def active_side
    SIDES[@active_side_index]
  end
end
