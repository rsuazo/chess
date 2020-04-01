class Cell
  attr_accessor :value, :x, :y, :color
  def initialize(x, y, value = '', color = '')
    @value = value
    @x, @y = x, y
    @color = color
  end

  def to_s
    %w(a b c d e f g h)[@x] + %w(1 2 3 4 5 6 7 8)[@y] 
  end

  def ==(obj)
    @y == obj.y && @x == obj.x 
  end

  def valid?
    (0..7) === @x && (0..7) === @y
  end

  def generate_white_pawn_moves
    list = []
    
    if @y == 1
      a = Cell.new(@x, @y + 1)
      b = Cell.new(@x, @y + 2)
      list = [a,b]
    elsif @y == 7
      puts "choose a new piece!"
    else
      a = Cell.new(@x, @y + 1)
      list = [a]
    end
    
    list.reject! { |item| !item.valid? }

    list
  end

  def generate_black_pawn_moves
    list = []
    
    if @y == 6
      a = Cell.new(@x, @y - 1)
      b = Cell.new(@x, @y - 2)
      list = [a,b]
    elsif @y == 0
      puts "choose a new piece!"
    else
      a = Cell.new(@x, @y - 1)
      list = [a]
    end
    
    list.reject! { |item| !item.valid? }

    list
  end

  def generate_knight_moves
    a = Cell.new(@x - 1, @y + 2)
    b = Cell.new(@x + 1, @y + 2)
    c = Cell.new(@x - 1, @y - 2)
    d = Cell.new(@x + 1, @y - 2)
    e = Cell.new(@x + 2, @y + 1)
    f = Cell.new(@x + 2, @y - 1)
    g = Cell.new(@x - 2, @y + 1)
    h = Cell.new(@x - 2, @y - 1)

    list = [a,b,c,d,e,f,g,h]
    
    list.reject! { |item| !item.valid? }

    list
  end


end