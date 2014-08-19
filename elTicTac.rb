
class TicTacToe
  require "./player"
  require "./computer"
  require "./board"

  def game_session(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two

    while board.not_full?
      @player_one.take_turn
      break if board.check_game(@player_one.letter)

      @player_two.take_turn
      break if board.check_game(@player_two.letter)
    end
    
    board.display_board
    puts "Game over!"
  end
end

game = TicTacToe.new
board = Board.new
player_one = Player.new(board, 'X')
player_two_AI = Tic_tac_AI.new(board, "O", "X")

game.game_session(board, player_one, player_two_AI)