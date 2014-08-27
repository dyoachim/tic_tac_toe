To start a new Tic Tac Toe game, create a `Board` object and a `Game` object, then `Game#session` method.

`Game#session` takes three parameters, the board and one for each player. You can fill this with either a `Player` object, or an `AIPlayer` object as shown below.

Require the files from the app folder

`require "./app/models/player"`  
`require "./app/models/ai"`  
`require "./app/models/game"`  
`require "./app/models/board"`


Create the Board and the Game

`board = Board.new`
`game = Game.new

Play with two humans  
`player_one = Player.new(board, 'X')`  
`player_two = Player.new(board, 'O')`  
`game.session(board, player_one, player_two)`  

Play with two computers  
`player_one_AI = AIPlayer.new(board, "X", "O")`  
`player_two_AI = AIPlayer.new(board, "O", "X")`  
`game.session(board, player_one_AI, player_two_AI)`    

Play Human-AI  
`player_one = Player.new(board, 'X')`  
`player_two_AI = AIPlayer.new(board, "O", "X")`  
`game.session(board, player_one, player_two_AI)`  

Use `ruby runner.rb` to view example in root directory.