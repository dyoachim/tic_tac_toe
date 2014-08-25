class Player

  attr_reader :letter
  def initialize(board, letter)
    @board = board
    @letter = letter
  end

  def take_turn
    gets.chomp.to_i - 1
  end
end