class Game
  def session(board, player_one, player_two)
    @board = board
    @player_one = player_one
    @player_two = player_two

    until @board.full?
      [@player_one, @player_two].each do |player|
        choice = false
        
        loop do 
          @board.puts_board
          puts player.letter + ":"
          choice = player.take_turn 
          break if @board.open_space?(choice)
        end

        @board.update_board(choice, player.letter)

        if @board.check_game(player.letter)
          @board.puts_board
          return
        end
      end
    end
  end
end