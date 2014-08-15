load "player.rb"
load "computer.rb"
load "board.rb"

class TicTacToe

  def game_session
    round = 1
    board = Board.new
    player_one = Player.new(board, 'X')
    player_two_AI = Tic_tac_AI.new(board, "O")


    while board.board.include?("_")
      player_one.take_turn
      break if board.check_game("X")

      player_two_AI.take_turn(round)
      break if board.check_game("O")

      round += 1
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