require 'spec_helper'

describe Board do
  # describe '#initialize' do
  #   it 'initializes the board with a grid' do
  #     expect { Board.new(grid: 'grid') }.to_not raise_error
  #   end

  #   it 'sets the grid with 8 rows by default' do
  #     board = Board.new
  #     expect(board.grid.size).to eq(8)
  #   end

  #   it 'creates eight things in each row by default' do
  #     board = Board.new
  #     board.grid.each do |row|
  #       expect(row.size).to eq(8)
  #     end
  #   end
  # end


  # describe '#grid' do
  #   it 'returns the grid' do
  #     board = Board.new(grid: 'blah')
  #     expect(board.grid).to eq 'blah'
  #   end
  # end

  # describe '#get_cell' do
  #   it 'returns the cell based on the (x, y) coordinate ' do
  #     grid = [["", "", ""], ["", "", 'something'], ["", "", ""]]
  #     board = Board.new(grid: grid)
  #     expect(board.get_cell(2, 1)).to eq 'something'
  #   end
  # end

  # describe '#set_cell' do
  #   it 'updates the value of the cell object at a (x, y) coordinate' do
  #     Cat = Struct.new(:value)
  #     grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
  #     board = Board.new(grid: grid)
  #     board.set_cell(0, 0, "meow")
  #     expect(board.get_cell(0, 0).value).to eq "meow"
  #   end
  # end

  # describe '#generate_rook_moves' do
  #   it 'generate_rook_moves recursive function' do
  #     board = Board.new
  #     start = [0,0]
  #     finish = [0,5]
  #     board.move_piece([0,1],[0,3])

  #     expect(board.generate_rook_moves(start, finish)).to eq []
  #   end
  # end

  describe '#generate_bishop_moves' do
  it 'generate_bishop_moves recursive function' do
    board = Board.new
    start = [2,0]
    finish = [0,2]
    board.move_piece([1,1],[1,3])

    expect(board.generate_bishop_moves(start, finish)).to eq []
  end
end


  # TestCell = Struct.new(:value)
  # let(:x_cell) { TestCell.new("X") }
  # let(:y_cell) { TestCell.new("Y") }
  # let(:empty) { TestCell.new }

end