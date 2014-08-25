require "./app/models/ai.rb"
require "./app/models/board.rb"

describe Tic_tac_AI do

	let!(:board) { Board.new }

	describe "first move" do
		it 'chooses center if possible' do
			board.board = ["X","_","_","_","_","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["X","_","_","_","O","_","_","_","_"]
		end

		it 'chooses corner if center not possible' do
			board.board = ["_","_","_","_","X","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","_","_","_","X","_","_","_","O"]
		end
	end

	describe "#try_win" do
		it 'will win horizontally if possible' do
			board.board = ["O","O","_","_","_","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true

			board.board = ["_","_","_","O","_","O","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true

			board.board = ["_","_","_","_","_","_","_","O","O"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true
		end

		it 'will win vertically if possible' do
			board.board = ["O","_","_","O","_","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true
			
			board.board = ["_","_","_","_","O","_","_","O","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true
			
			board.board = ["_","_","_","_","_","O","_","_","O"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true
		end

		it 'will win diagonally if possible' do
			board.board = ["O","_","_","_","O","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true

			board.board = ["_","_","O","_","O","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.check_game("O")).to eq true
		end
	end

	describe "#try_block" do
		it 'will block horizontally if possible' do
			board.board = ["X","X","_","_","_","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["X","X","O","_","_","_","_","_","_"]

			board.board = ["_","_","_","X","_","X","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","_","_","X","O","X","_","_","_"]

			board.board = ["_","_","_","_","_","_","_","X","X"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","_","_","_","_","_","O","X","X"]
		end

		it 'will block vertically if possible' do
			board.board = ["X","_","_","X","_","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["X","_","_","X","_","_","O","_","_"]
			
			board.board = ["_","_","_","_","X","_","_","X","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","O","_","_","X","_","_","X","_"]
			
			board.board = ["_","_","_","_","_","X","_","_","X"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","_","O","_","_","X","_","_","X"]
		end

		it 'will block diagonally if possible' do
			board.board = ["X","_","_","_","X","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["X","_","_","_","X","_","_","_","O"]

			board.board = ["_","_","X","_","X","_","_","_","_"]
			com_player = Tic_tac_AI.new(board, "O", "X")
			com_player.take_turn
			expect(board.board).to eq ["_","_","X","_","X","_","O","_","_"]
		end
	end
end