class Tic_tac_AI

	def initialize(board, letter, opponent_letter)
    @board = board
    @letter = letter
    @opponent_letter = opponent_letter
  end

  def take_turn
    @board.display_board
    puts @letter + ":"
    sleep(1)

    return if can_win?
    return if can_block?

    if @board.board.include?(@opponent_letter) && !(@board.board.include?(@letter))
      if @board.board[4] == '_'
        move = 4
      elsif @board.board[4] == @opponent_letter
        move = 0 unless @board.board[0] != '_'
        move = 2 unless @board.board[2] != '_'
        move = 6 unless @board.board[6] != '_'
        move = 8 unless @board.board[8] != '_'
      end
      @board.board[move] = @letter
    else 
      make_move
    end
  end


  def make_move
    win_chance = [@letter, @letter,'_','_','_'].permutation(3).map(&:join).uniq
    board = @board.board

    if win_chance.include?([board[3], board[4], board[5]].join)
      choice = [3,5]
    elsif win_chance.include?([board[1], board[4], board[7]].join)
      choice = [1,7]
    elsif win_chance.include?([board[0], board[3], board[6]].join)
      choice = [0,6]
    elsif win_chance.include?([board[2], board[5], board[8]].join)
      choice = [2,8]
    elsif win_chance.include?([board[0], board[1], board[2]].join)
      choice = [0,2]
    elsif win_chance.include?([board[6], board[7], board[8]].join)
      choice = [6,8]
    elsif win_chance.include?([board[2], board[4], board[6]].join)
      choice = [2,6]
    else 
      choice = [] << board.index('_')
    end

    if board[choice[0]] == "_"
      @board.board[choice[0]] = @letter
    else
      @board.board[choice[1]] = @letter
    end
  end

  def can_win?
    win_chance = [@letter, @letter,'_'].permutation(3).map(&:join).uniq
    board = @board.board

    @board.combos.each do |combo|
      line = [board[combo[0]], board[combo[1]], board[combo[2]]].join
      if win_chance.include?(line)
        (0..2).each do |place|
          if board[combo[place]] == "_"
            @board.board[combo[place]] = @letter
            return true
          end
        end
      end
    end
    false
  end

  def can_block?
    block_chance = [@opponent_letter, @opponent_letter,'_'].permutation(3).map(&:join).uniq
    board = @board.board

    @board.combos.each do |combo|
      line = [board[combo[0]], board[combo[1]], board[combo[2]]].join
      if block_chance.include?(line)
        (0..2).each do |place|
          if board[combo[place]] == "_"
            @board.board[combo[place]] = @letter
            return true
          end
        end
      end
    end
    false
  end
end