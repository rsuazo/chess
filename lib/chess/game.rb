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

    letter_to_num = {
      'a' => 0,
      'b' => 1,
      'c' => 2,
      'd' => 3,
      'e' => 4,
      'f' => 5,
      'g' => 6,
      'h' => 7
    }

    [letter_to_num[human_move[0].downcase], human_move[1].to_i - 1]
  end


  def play
    puts "#{current_player.name} has randomly been selected as the first player"
    while true
      board.formatted_grid
      puts ""
      puts solicit_move
      x, y = get_move
      board.set_cell(x, y, current_player.color)
      if board.game_over
        puts game_over_message
        board.formatted_grid
        return
      else
        switch_players
      end
    end
  end
  
end


