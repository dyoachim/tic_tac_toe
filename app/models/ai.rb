class Tic_tac_AI
  attr_reader :letter

  def initialize(board, letter, opponent_letter)
    @board = board
    @letter = letter
    @opponent_letter = opponent_letter
  end

  def take_turn
    win = can_win?
    block = can_block?

    return win if  win
    return block if block

    make_move
  end

  def make_move
    win_chance = [@letter, @letter,'_','_','_'].permutation(3).map(&:join).uniq
    board = @board.board
    choice = []

    @board.combos.each do |win_numbers|
      if board.uniq.length == 1 || board.uniq.length == 2
        choice << 4
        [0,2,6,8].shuffle.each { |place| choice << place }
      end

      if win_chance.include?([ board[win_numbers[0]], board[win_numbers[1]], board[win_numbers[2]]].join)
        choice << win_numbers[0]
        choice << win_numbers[2]
      end
    end

    choice << board.index('_')
    choice.uniq.find {|place| @board.open_space?(place) }
  end

  def can_win?
    find_space_between(@letter)
  end

  def can_block?
    find_space_between(@opponent_letter)
  end

  def find_space_between(letter)
    block_chance = [letter, letter,'_'].permutation(3).map(&:join).uniq
    board = @board.board

    @board.combos.each do |combo|
      line = [board[combo[0]], board[combo[1]], board[combo[2]]].join
      if block_chance.include?(line)
        (0..2).each do |place|
          return combo[place] if @board.open_space?(combo[place])
        end
      end
    end
    false
  end
end