class Board

  attr_reader :combos
  attr_accessor :board

  def initialize
    @combos = [[0,1,2],[3,4,5],[6,7,8],[0, 3, 6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    @board = ["_", "_", "_",
              "_", "_", "_",
              "_", "_", "_"]
  end

  def display_board
    system 'clear'
    board = @board
    puts "Welcome to Tic-Tac-Toe. Input 1-9 to make a move."
    puts ".........."
    puts board[0] + board[1] + board[2]
    puts board[3] + board[4] + board[5]
    puts board[6] + board[7] + board[8]
    puts ".........."
  end

  def check_game(player)
    combos = @combos.map {|combo| @board[combo[0]] + @board[combo[1]] + @board[combo[2]]}
    return combos.include?(player*3) || @board.include?("_") == false
  end
end