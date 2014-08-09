class TicTacToe

  def game_session
    
    system 'clear'

    round = 1
    @board = ["_", "_", "_",
              "_", "_", "_",
              "_", "_", "_",
              ]
    puts "Welcome to Tic-Tac-Toe. Input 1-9 to make a move."

    while @board.include?("_")
      player_turn("X")
      break if check_game("X")

      #player_turn("O")
      computer_turn(round)
      break if check_game("O")

      round += 1
    end
    
    display_board
    puts "Game over! Play again? y/n"
    if gets.chomp == 'y'
      self.game_session
    end
  end

  private

  def display_board
    system 'clear'
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
      sleep(1)
      player_turn(player)
      return
    end
    @board[move] = player 
  end

  def computer_turn(round)
    display_board
    puts "O:"
    sleep(1)

    return if try_blocking

    if round == 1
      if [@board[0],@board[2],@board,[6],@board[8]].include?('X') && @board[4] == '_'
        move = 4

      elsif @board[4] == 'X'
          move = 0 unless @board[0] != '_'
          move = 2 unless @board[2] != '_'
          move = 6 unless @board[6] != '_'
          move = 8 unless @board[8] != '_'
           
      elsif [@board[1],@board[3],@board,[5],@board[7]].include?('X')
      end
    end

    if move 
      @board[move] = "O" 
    else 
      puts 'Panic'
    end
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

  def try_blocking
    board = @board
    move = false
    block_chance = ['_XX','X_X','XX_']


    [0,3,6].each do |i|
      line = [board[i], board[i+1], board[i+2]].join
      block_chance.include?(line) ? move = i + line.index('_') : false
    end

    [0,1,2].each do |i|
      line = [board[i], board[i+3], board[i+6]].join
      block_chance.include?(line) ? move = i + line.index('_') * 3 : false
    end

    diagonal_backward = [board[0], board[4], board[8]].join
    diagional_forward = [board[2], board[4], board[6]].join

    block_chance.include?(diagonal_backward) ? move = diagonal_backward.index('_') * 4     : false
    block_chance.include?(diagional_forward) ? move = diagional_forward.index('_') * 2 + 2 : false

    move ? @board[move] = "O" : false
  end
end

game = TicTacToe.new
game.game_session
        