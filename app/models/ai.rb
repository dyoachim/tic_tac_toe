class AIPlayer
  attr_reader :letter

  def initialize(board, letter, opponent_letter)
    @board = board
    @letter = letter
    @opponent_letter = opponent_letter
  end

  def take_turn
    win = find_space_between(@letter)
    block = find_space_between(@opponent_letter)

    return win if  win
    return block if block

    make_move
  end

  def make_move
    win_chance = [@letter, @letter,'_','_','_'].permutation(3).map(&:join).uniq
    board = @board.board
    choice = []

    @board.combos.each do |win_numbers|
      if win_chance.include?([ board[win_numbers[0]], board[win_numbers[1]], board[win_numbers[2]]].join)
        win_numbers.each do |number|
          choice << number if @board.open_space?(number)
        end
      end
    end

    freq = choice.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
    max = freq.values.max
    pick = freq.find { |k, f| f == max }
  
    return pick.first
  end


  private
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