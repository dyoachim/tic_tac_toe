require "./app/models/game"
require "./app/models/player"
require "./app/models/ai"
require "./app/models/board"


game = Game.new
board = Board.new
player_one = Player.new(board, 'X')
player_two_AI = AIPlayer.new(board, "O", "X")

game.session(board, player_one, player_two_AI)