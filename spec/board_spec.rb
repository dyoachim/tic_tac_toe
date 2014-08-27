require "./app/models/board.rb"

describe Board do

  let!(:board) { Board.new }

  describe "#show_board" do
    it 'returns formatted string representing tic tac toe board' do
      expect(board.show_board).to eq (
    %Q{ 
      Welcome to Tic-Tac-Toe. Input 1-9 to make a move.
      ..........
      ___
      ___
      ___
      ..........
    }
        )
    end
  end

  describe "#full?" do
    it 'returns false if board is not full' do
      expect(board.full?).to be false
    end

    it 'returns false if board is not full' do
      board.board = ["X","X","X","X","X","X","X","X","_"]
      expect(board.full?).to be false
    end

    it 'returns true if board is full' do
      board.board = ["X","X","X","X","X","X","X","X","X"]
      expect(board.full?).to be true
    end
  end

  describe "#open_space?" do
    it 'returns true if space is open' do
      (0..8).each do |place|
        expect(board.open_space?(place)).to be true
      end
    end

    it 'returns false if space is taken' do
      board.board = ["X","X","X","X","X","X","X","X","X"]
      (0..8).each do |place|
        expect(board.open_space?(place)).to be false
      end
    end
  end

  describe "#update_board?" do
    it 'updates the board at the given position' do
      (0..8).each do |player_choice|
        expect(board.board[player_choice]).to eq "_"
        board.update_board(player_choice, "X")
        expect(board.board[player_choice]).to eq "X"
      end
      expect(board.board).to eq ["X","X","X","X","X","X","X","X","X"]
    end
  end

  describe "#check_board" do
    it 'returns true if a player has won' do
      board.combos.each do |combo|
        board.board = ["_","_","_","_","_","_","_","_","_"]
        combo.each do |place|
          board.board[place] = "X"
        end
        expect(board.check_game("X")).to eq true
      end
    end

    it 'returns true if the board is full with no winner' do
      board.combos.each do |combo|
        board.board = ("A".."I").to_a
        expect(board.check_game("X")).to eq true
      end
    end

    it 'returns false if no player has won' do
      board.combos.each do |combo|
        board.board = ["_","_","_","_","_","_","_","_","_"]
        range = ["X","O","X"]
        combo.each do |place|
          board.board[place] = range.pop
        end
        expect(board.check_game("X")).to eq false
      end
    end
  end
end