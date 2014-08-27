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
    choice = []

    return win if  win
    return block if block

    @board.combos.each do |win_numbers|
      win_numbers.each do |number|
        choice << number if @board.open_space?(number)
      end
    end

    freq = choice.inject(Hash.new(0)) { |k,v| k[v] += 1; k }
    max = freq.values.max
    pick = freq.find { |k, f| f == max }
  
    return pick.first
  end


  private
  def find_space_between(letter)
    @board.combos.each do |combo|
      line = ""
      combo.each { |place| line += @board.board[place] }

      blank = /_/ =~ line

      if blank
        line[blank] = letter
        return combo[blank] if line == letter * line.length
      end
    end

    false
  end
end