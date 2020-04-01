class Board
  
  attr_reader :grid, :pieces
  def initialize(input = {})
    @grid = input.fetch(:grid, default_grid)
    @pieces = {
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
    set_board

  end

  def get_cell(x, y)
    grid[y][x]
  end

  def set_cell(x, y, value, color)
    get_cell(x, y).value = value
    get_cell(x, y).x = x
    get_cell(x, y).y = y
    get_cell(x, y).color = color
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
 
    white_pieces = ["\u2656", "\u2658", "\u2657", "\u2654", "\u2655", "\u2657", "\u2658", "\u2656"]
    black_pieces = ["\u265C", "\u265E", "\u265D", "\u265A", "\u265B", "\u265D", "\u265E", "\u265C"]
    
    a = 0
    b = 2

    4.times {
      8.times {
        set_cell(a, b, '', '')
        a += 1
      }
      a = 0
      b += 1
    }

    x = 0
    y = 0

    8.times {
      set_cell(y, 1, pieces[:white_pawn], 'white')
      set_cell(y, 6, pieces[:black_pawn], 'black')
      y+=1
    }

    white_pieces.each { |piece| 
      set_cell(x,0, white_pieces[x], 'white')
      x+=1
    }

    x = 0

    black_pieces.each { |piece| 
    set_cell(x,7,black_pieces[x], 'black')
    x+=1
    }
  end

  def move_piece(start, finish)
    if valid_move?(start, finish)
      set_cell(*finish, get_cell(*start).value, get_cell(*start).color)
      set_cell(*start, '', '')
      true
    else
      false
    end
  end

  def valid_move?(start, finish)
    # first grab the cell in question
    x = get_cell(*start)
    y = get_cell(*finish)

    #if value of start is empty, false
    return false if x.value == ''

    case x.value
    when pieces[:black_pawn]
      if y.value == '' && x.generate_black_pawn_moves.any? { |move| move == y }
        true
      elsif x.color != y.color && x.generate_black_pawn_moves.any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_pawn]
      if y.value == '' && x.generate_white_pawn_moves.any? { |move| move == y }
        true
      elsif x.color != y.color && x.generate_white_pawn_moves.any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_knight]
      if y.value == '' && x.generate_knight_moves.any? { |move| move == y }
        true
      elsif x.color != y.color && x.generate_knight_moves.any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:black_knight]
      if y.value == '' && x.generate_knight_moves.any? { |move| move == y }
        true
      elsif x.color != y.color && x.generate_knight_moves.any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_rook]

      if y.value == '' && generate_rook_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_rook_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:black_rook]
      if y.value == '' && generate_rook_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_rook_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_bishop]
      if y.value == '' && generate_bishop_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_bishop_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:black_bishop]
      if y.value == '' && generate_bishop_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_bishop_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_queen]
      if y.value == '' && generate_queen_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_queen_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:black_queen]
      if y.value == '' && generate_queen_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_queen_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:white_king]
      if y.value == '' && generate_king_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_king_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    when pieces[:black_king]
      if y.value == '' && generate_king_moves(start, finish).any? { |move| move == y }
        true
      elsif x.color != y.color && generate_king_moves(start, finish).any? { |move| move == y }
        true
      else
        false
      end
    else
    end

  end

  def generate_rook_moves(start, finish, list = [], start_cell = get_cell(*start))

    x_diff = finish[0] - start[0]
    y_diff = finish[1] - start[1]

    
    return list if !valid?(*start) || !valid?(*finish)
    return list if x_diff != 0 && y_diff != 0


    list << get_cell(*start)

    return list if get_cell(*start).value != '' && get_cell(*start) != start_cell


    return list if start == finish

    if x_diff == 0
      if y_diff > 0
        start = [start[0], start[1] + 1]
        generate_rook_moves(start, finish, list, start_cell)
      else
        start = [start[0], start[1] - 1]
        generate_rook_moves(start, finish, list, start_cell)
      end
    else
      if x_diff > 0
        start = [start[0] + 1, start[1]]
        generate_rook_moves(start, finish, list, start_cell)
      else
        start = [start[0] - 1, start[1]]
        generate_rook_moves(start, finish, list, start_cell)
      end
    end

  end

  def generate_bishop_moves(start, finish, list = [], start_cell = get_cell(*start))

    return list if !valid?(*start) || !valid?(*finish)

    x_diff = finish[0] - start[0]
    y_diff = finish[1] - start[1]

    list << get_cell(*start)

    return list if x_diff == 0 || y_diff == 0 

    return list if get_cell(*start).value != '' && get_cell(*start) != start_cell


    return list if start == finish

    if x_diff < 0
      if y_diff > 0
        start = [start[0] - 1, start[1] + 1]
        generate_bishop_moves(start, finish, list, start_cell)
      else
        start = [start[0] - 1, start[1] - 1]
        generate_bishop_moves(start, finish, list, start_cell)
      end
    else
      if y_diff > 0
        start = [start[0] + 1, start[1] + 1]
        generate_bishop_moves(start, finish, list, start_cell)
      else
        start = [start[0] + 1, start[1] - 1]
        generate_bishop_moves(start, finish, list, start_cell)
      end
    end

  end

  def generate_queen_moves(start, finish, list = [], start_cell = get_cell(*start))

    return list if !valid?(*start) || !valid?(*finish)

    x_diff = finish[0] - start[0]
    y_diff = finish[1] - start[1]

    list << get_cell(*start)

    return list if get_cell(*start).value != '' && get_cell(*start) != start_cell

    return list if start == finish

    if x_diff < 0
      if y_diff > 0
        start = [start[0] - 1, start[1] + 1]
        generate_queen_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0] - 1, start[1] - 1]
        generate_queen_moves(start, finish, list, start_cell)
      elsif y_diff == 0
        start = [start[0] - 1, start[1]]
        generate_queen_moves(start, finish, list, start_cell)
      end
    elsif x_diff > 0
      if y_diff > 0
        start = [start[0] + 1, start[1] + 1]
        generate_queen_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0] + 1, start[1] - 1]
        generate_queen_moves(start, finish, list, start_cell)
      elsif y_diff == 0
        start = [start[0] + 1, start[1]]
        generate_queen_moves(start, finish, list, start_cell)
      end
    elsif x_diff == 0
      if y_diff > 0
        start = [start[0], start[1] + 1]
        generate_queen_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0], start[1] - 1]
        generate_queen_moves(start, finish, list, start_cell)
      end
    end

  end

  def generate_king_moves(start, finish, list = [], start_cell = get_cell(*start))

    x_diff = finish[0] - start[0]
    y_diff = finish[1] - start[1]

    return list if !valid?(*start) || !valid?(*finish)
    return list if x_diff > 1 || y_diff > 1

    list << get_cell(*start)
    return list if start == finish

    return list if get_cell(*start).value != '' && get_cell(*start) != start_cell


    if x_diff < 0
      if y_diff > 0
        start = [start[0] - 1, start[1] + 1]
        generate_king_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0] - 1, start[1] - 1]
        generate_king_moves(start, finish, list, start_cell)
      elsif y_diff == 0
        start = [start[0] - 1, start[1]]
        generate_king_moves(start, finish, list, start_cell)
      end
    elsif x_diff > 0
      if y_diff > 0
        start = [start[0] + 1, start[1] + 1]
        generate_king_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0] + 1, start[1] - 1]
        generate_king_moves(start, finish, list, start_cell)
      elsif y_diff == 0
        start = [start[0] + 1, start[1]]
        generate_king_moves(start, finish, list, start_cell)
      end
    elsif x_diff == 0
      if y_diff > 0
        start = [start[0], start[1] + 1]
        generate_king_moves(start, finish, list, start_cell)
      elsif y_diff < 0
        start = [start[0], start[1] - 1]
        generate_king_moves(start, finish, list, start_cell)
      end
    end

  end
  
  def valid?(x, y)
    (0..7) === x && (0..7) === y
  end

  private

  def default_grid
    Array.new(8) { Array.new(8) { Cell.new(0,0) } }
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
  
end
