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
      sets = [["X", "_", "X"], ["_", "X", "X"], ["X", "X", "_"]]
      
      board.combos.each do |combo|
        sets.each do |set|
          board.board = ["_","_","_","_","_","_","_","_","_"]
          board.board[combo[0]] = set[0]
          board.board[combo[1]] = set[1]
          board.board[combo[2]] = set[2]
          ai.take_turn
          expect(ai.take_turn).to eq combo[set.index('_')]
        end
      end
    end

    it "blocks if it can" do
      sets = [["O", "_", "O"], ["O", "_", "O"], ["O", "_", "O"]]
      
      board.combos.each do |combo|
        sets.each do |set|
          board.board = ["_","_","_","_","_","_","_","_","_"]
          board.board[combo[0]] = set[0]
          board.board[combo[1]] = set[1]
          board.board[combo[2]] = set[2]
          ai.take_turn
          expect(ai.take_turn).to eq combo[set.index('_')]
        end
      end
    end

    it 'chooses center if possible' do
      board.board = ["X","_","_","_","_","_","_","_","_"]
      expect(ai.take_turn).to be 4
    end

    it 'chooses corner if center not possible' do
      board.board = ["_","_","_","_","X","_","_","_","_"]
      expect([0,2,6,8]).to include(ai.take_turn)
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
end