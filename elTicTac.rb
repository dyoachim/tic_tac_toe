
class TicTacToe
  require "./player"
  require "./computer"
  require "./board"

  def game_session
    board = Board.new
    player_one = Player.new(board, 'X')
    player_two_AI = Tic_tac_AI.new(board, "O")

    while board.board.include?("_")
      player_one.take_turn
      break if board.check_game("X")

      player_two_AI.take_turn
      break if board.check_game("O")
    end
    
    board.display_board
    puts "Game over! Play again? y/n"
    if gets.chomp == 'y'
      self.game_session
    end
  end
end

game = TicTacToe.new
game.game_session