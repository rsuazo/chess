class Game
  
  attr_reader :players, :board, :current_player
  def initialize(players, board = Board.new)
    @players = players
    @board = board
    @current_player, @other_player = players.shuffle
  end
  
  def solicit_move
    "#{current_player.name}: Enter a number between 1 and 7 to make your move"
  end

  def get_move(human_move = gets.chomp)
    human_move_to_coordinate(human_move)
  end

  def human_move_to_coordinate(human_move)
    x = human_move.to_i - 1
    y = 5

    while y >= 0 do
      if board.get_cell(x, y).value == ''
        return [x, y]
      else
        y -= 1
      end
    end
  end
  
end