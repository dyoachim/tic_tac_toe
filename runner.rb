require "./app/models/player"
require "./app/models/ai"
require "./app/models/board"


board = Board.new
player_one = Player.new(board, 'X')
player_two_AI = Tic_tac_AI.new(board, "O", "X")

board.game_session(player_one, player_two_AI)