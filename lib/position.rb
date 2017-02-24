class Position
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = to_int(x), to_int(y)
  end

  def is_valid?
    !@x.nil? && !@y.nil?
  end

  def to_s
    "#{@x}, #{@y}"
  end

  private
  def to_int(value)
    begin
      Integer(value)
    rescue Exception => e
      nil
    end
  end
end