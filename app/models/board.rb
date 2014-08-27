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
    %Q{ 
      Welcome to Tic-Tac-Toe. Input 1-9 to make a move.
      ..........
      #{@board[0] + @board[1] + @board[2]}
      #{@board[3] + @board[4] + @board[5]}
      #{@board[6] + @board[7] + @board[8]}
      ..........
    }
  end

  def puts_board
    system "clear"
    puts show_board
  end

  def full?
    return !@board.include?("_")
  end

  def open_space?(space_number)
    return false unless (0..8).include?(space_number)
    return @board[space_number] == "_"
  end

  def update_board(player_choice, player_letter)
    @board[player_choice] = player_letter
  end

  def check_game(player)
    combos = @combos.map {|combo| @board[combo[0]] + @board[combo[1]] + @board[combo[2]]}
    return combos.include?(player*3) || full?
  end
end