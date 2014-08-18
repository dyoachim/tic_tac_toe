class Player

  attr_reader :letter
  def initialize(board, letter)
    @board = board
    @letter = letter
  end

  def get_number
    gets.chomp.to_i - 1
  end

  def take_turn
  	@board.display_board
    puts @letter + ":"
    move = get_number
    
    if !((0..8).include?(move))
      puts "Invalid move!"
      sleep(1)
      self.take_turn
    elsif @board.board[move] != '_'
      puts "Already taken!"
      sleep(1)
      self.take_turn
    end
    
    @board.board[move] = @letter
  end
end