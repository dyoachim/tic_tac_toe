class Player

  def initialize(board, letter)
    @board = board
    @letter = letter
  end

  def take_turn
  	@board.display_board
    puts @letter + ":"
    move = gets.chomp.to_i - 1

    if @board.board[move] != '_'
      puts "Already taken!"
      sleep(1)
      self.take_turn
      return
    end
    
    @board.board[move] = @letter
  end
end