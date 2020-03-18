class Cell
  attr_accessor :value, :x, :y
  def initialize(value = '')
    @value = value
    @y, @x = x, y
  end

  def to_s
    %w(a b c d e f g h)[@x] + %w(1 2 3 4 5 6 7 8)[@y] 
  end

end