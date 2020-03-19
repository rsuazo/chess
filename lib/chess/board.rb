class Board
  
  attr_reader :grid
  def initialize(input = {})
    @grid = input.fetch(:grid, default_grid)
    set_board
  end

  def get_cell(x, y)
    grid[y][x]
  end

  def set_cell(x, y, value)
    get_cell(x, y).value = value
  end

  def game_over
    return :winner if winner?
    return :draw if draw?
    false
  end

  def formatted_grid
    grid.each do |row|
      puts row.map { |cell| cell.value.empty? ? "_" : cell.value }.join("|")
    end
  end

  def set_board

    pieces = {
      white_pawn: "\u2659",
      white_rook: "\u2656",
      white_knight: "\u2658",
      white_bishop: "\u2657",
      white_king: "\u2654",
      white_queen: "\u2655",
      black_pawn: "\u265F",
      black_rook: "\u265C",
      black_knight: "\u265E",
      black_bishop: "\u265D",
      black_king: "\u265A",
      black_queen: "\u265B"
    }
    
    white_pieces = ["\u2656", "\u2658", "\u2657", "\u2654", "\u2655", "\u2657", "\u2658", "\u2656"]
    black_pieces = ["\u265C", "\u265E", "\u265D", "\u265A", "\u265B", "\u265D", "\u265E", "\u265C"]
    
    x = 0
    y = 0

    8.times {
      set_cell(y, 1, pieces[:white_pawn])
      set_cell(y, 6, pieces[:black_pawn])
      y+=1
    }

    white_pieces.each { |piece| 
      set_cell(x,0,white_pieces[x])
      x+=1
    }

    x = 0

    black_pieces.each { |piece| 
    set_cell(x,7,black_pieces[x])
    x+=1
    }
  end

  def move_piece(start, finish)
    x = get_cell(*start).value
    set_cell(*start, '')
    set_cell(*finish, x)
  end

  private

  def default_grid
    Array.new(8) { Array.new(8) { Cell.new } }
  end

  def draw?
    grid.flatten.map { |cell| cell.value }.none_empty?
  end

  def winner?
    winning_positions.each do |winning_position|
      next if winning_position_values(winning_position).all_empty?
      return true if winning_position_values(winning_position).four_in_a_row?
    end
    false
  end
   
  def winning_position_values(winning_position)
    winning_position.map { |cell| cell.value }
  end
  
  def winning_positions
    grid + # rows
    grid.transpose + # columns
    diagonals # two diagonals
  end
  
  def diagonals
    [
      [get_cell(0, 0), get_cell(1, 1), get_cell(2, 2), get_cell(3, 3), get_cell(4, 4), get_cell(5, 5)],
      [get_cell(1, 0), get_cell(2, 1), get_cell(3, 2), get_cell(4, 3), get_cell(5, 4), get_cell(6, 5)],
      [get_cell(2, 0), get_cell(3, 1), get_cell(4, 2), get_cell(5, 3), get_cell(6, 4)],
      [get_cell(3, 0), get_cell(4, 1), get_cell(5, 2), get_cell(6, 3)],
      [get_cell(0, 1), get_cell(1, 2), get_cell(2, 3), get_cell(3, 4), get_cell(4, 5)],
      [get_cell(0, 2), get_cell(1, 3), get_cell(2, 4), get_cell(3, 5)],
      [get_cell(6, 0), get_cell(5, 1), get_cell(4, 2), get_cell(3, 3), get_cell(2, 4), get_cell(1, 5)],
      [get_cell(5, 0), get_cell(4, 1), get_cell(3, 2), get_cell(2, 3), get_cell(1, 4), get_cell(0, 5)],
      [get_cell(4, 0), get_cell(3, 1), get_cell(2, 2), get_cell(1, 3), get_cell(0, 4)],
      [get_cell(3, 0), get_cell(2, 1), get_cell(1, 2), get_cell(0, 3)],
      [get_cell(6, 1), get_cell(5, 2), get_cell(4, 3), get_cell(3, 4), get_cell(2, 5)],
      [get_cell(6, 2), get_cell(5, 3), get_cell(4, 4), get_cell(3, 5)]
    ]
  end
end
