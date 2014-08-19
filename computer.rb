class Tic_tac_AI
  attr_reader :letter

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

    make_move
  end

  def make_move
    win_chance = [@letter, @letter,'_','_','_'].permutation(3).map(&:join).uniq
    board = @board.board

    if board.include?(@opponent_letter) && !(board.include?(@letter))
      if @board.open?(4)
        choice = [4]
      else
        pick = [0,2,6,8].sample until pick && @board.open?(pick)
        choice = [] << pick
      end
    elsif win_chance.include?([board[3], board[4], board[5]].join)
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

    if @board.open?(choice[0])
      @board.board[choice[0]] = @letter
    else
      @board.board[choice[1]] = @letter
    end
  end

  def can_win?
    space_between = find_space_between(@letter)
    space_between ? @board.board[space_between] = @letter : false
  end

  def can_block?
    space_between = find_space_between(@opponent_letter)
    space_between ? @board.board[space_between] = @letter : false 
  end

  def find_space_between(letter)
    block_chance = [letter, letter,'_'].permutation(3).map(&:join).uniq
    board = @board.board

    @board.combos.each do |combo|
      line = [board[combo[0]], board[combo[1]], board[combo[2]]].join
      if block_chance.include?(line)
        (0..2).each do |place|
          return combo[place] if @board.open?(combo[place])
        end
      end
    end
    false
  end
end