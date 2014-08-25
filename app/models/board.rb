class Board

  attr_reader :combos
  attr_accessor :board

  def initialize
    @combos = [[0,1,2],[3,4,5],[6,7,8],[0, 3, 6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @board = ["_", "_", "_",
              "_", "_", "_",
              "_", "_", "_"]
  end

  def show_board
    board = @board
    
    %Q{ 
      Welcome to Tic-Tac-Toe. Input 1-9 to make a move.
      ..........
      #{board[0] + board[1] + board[2]}
      #{board[3] + board[4] + board[5]}
      #{board[6] + board[7] + board[8]}
      ..........
    }
  end

  def not_full?
    return @board.include?("_") 
  end

  def open?(space_number)
    return @board[space_number] == "_"
  end

  def check_game(player)
    combos = @combos.map {|combo| @board[combo[0]] + @board[combo[1]] + @board[combo[2]]}
    return combos.include?(player*3) || !not_full?
  end

  def game_session(player_one, player_two)
    while not_full?
      [player_one, player_two].each do |player|
        system 'clear'
        puts show_board
        player.take_turn

        if check_game(player.letter)
          system 'clear'
          puts show_board
          return
        end
      end
    end
  end
end