To start a new Tic Tac Toe game, create a `Board` object and call the `#game_session` method.

`#game_session` takes two parameters, one for each player. You can fill this with either a `Player` object, or an `Tic_tac_AI` object as shown below.

Require the files from the app folder

`require "./app/models/player"`  
`require "./app/models/ai"`  
`require "./app/models/board"`


Create the board

`board = Board.new`

Play with two humans  
`player_one = Player.new(board, 'X')`
`player_two = Player.new(board, 'O')`
`board.game_session(player_one, player_two)`

Play with two computers  
`player_one_AI = Tic_tac_AI.new(board, "X", "O")`
`player_two_AI = Tic_tac_AI.new(board, "O", "X")`
`board.game_session(player_one_AI, player_two_AI)`

Play Human-AI  
`player_one = Player.new(board, 'X')`
`player_two_AI = Tic_tac_AI.new(board, "O", "X")`
`board.game_session(player_one, player_two_AI)`

Use `ruby runner.rb` to view example in root directory.