require "./app/models/ai.rb"
require "./app/models/board.rb"

describe AIPlayer do

  let!(:board) { Board.new }
  let!(:ai) { AIPlayer.new(board, "X", "O")}

  describe "#take_turn" do
    it 'responds to #take_turn' do
      expect(ai).to respond_to(:take_turn)
    end

    it "wins if it can" do
      board.combos.each do |combo|
        sets = [["X", "_", "X"], ["X", "_", "X"], ["X", "_", "X"]]
        sets.each do |set|
          board.board[combo[0]] = set[0]
          board.board[combo[1]] = set[1]
          board.board[combo[2]] = set[2]
          ai.take_turn
          expect(ai.take_turn).to eq ai.find_space_between("X")
        end
      end
    end

    it "blocks if it can" do
      board.combos.each do |combo|
        sets = [["O", "_", "O"], ["O", "_", "O"], ["O", "_", "O"]]
        sets.each do |set|
          board.board[combo[0]] = set[0]
          board.board[combo[1]] = set[1]
          board.board[combo[2]] = set[2]
          ai.take_turn
          expect(ai.take_turn).to eq ai.find_space_between("O")
        end
      end
    end

    it "makes a move otherwise" do
      ["O","X","_","_","_","_","_","_","_"].permutation(9).each do |potential_board|
        board.board = potential_board
        expect(ai.take_turn).to be_a Integer 
      end

      ["O","X","O","_","_","_","_","_","_"].permutation(9).each do |potential_board|
        board.board = potential_board
        expect(ai.take_turn).to be_a Integer 
      end

      ["O","X","O","X","_","_","_","_","_"].permutation(9).each do |potential_board|
        board.board = potential_board
        expect(ai.take_turn).to be_a Integer 
      end
    end
  end

  describe "#make_move" do
    describe "first move" do
      it 'chooses center if possible' do
        board.board = ["X","_","_","_","_","_","_","_","_"]
        expect(ai.take_turn).to be 4
      end

      it 'chooses corner if center not possible' do
        board.board = ["_","_","_","_","X","_","_","_","_"]
        expect([0,2,6,8]).to include(ai.take_turn)
      end
    end
  end

  describe "#find_space_between" do
    it 'determines the place on the board between two letters' do
      board.combos.each do |combo|
        board.board = ["_","_","_","_","_","_","_","_","_"]
        sets = [["X", "_", "X"], ["X", "_", "X"], ["X", "_", "X"]]
        sets.each do |set|
          board.board[combo[0]] = set[0]
          board.board[combo[1]] = set[1]
          board.board[combo[2]] = set[2]
          expect(ai.find_space_between("X")).to eq combo[set.index("_")]
        end
      end
    end
  end
end