class TicTacToe

  def game_session
    @board = ["_", "_", "_",
              "_", "_", "_",
              "_", "_", "_",
              ]
    puts "Welcome to Tic-Tac-Toe. Input 1-9 to make a move."

    while @board.include?("_")
      player_turn("X")
      break if check_game("X")

      player_turn("O")
      break if check_game("O")
    end
    
    display_board
    puts "Game over! Play again? y/n"
    if gets.chomp == 'y'
      self.game_session
    end
  end

  private

  def display_board
    board = @board
    puts ".........."
    puts board[0] + board[1] + board[2]
    puts board[3] + board[4] + board[5]
    puts board[6] + board[7] + board[8]
    puts ".........."
  end

  def player_turn(player)
    display_board
    puts player + ":"
    move = gets.chomp.to_i - 1
    if @board[move] != '_'
      puts "Already taken!"
      player_turn(player)
      return
    end
    @board[move] = player 
  end

  def check_game(player)
    board = @board
    return [
      #horizontal
      board[0] + board[1] + board[2],
      board[3] + board[4] + board[5],
      board[6] + board[7] + board[8],
      #verticle
      board[0] + board[3] + board[6],
      board[1] + board[4] + board[7],
      board[2] + board[5] + board[8],
      #diagonal
      board[0] + board[4] + board[8],
      board[2] + board[4] + board[6] ].include?(player*3)
  end
end

game = TicTacToe.new
game.game_session
        