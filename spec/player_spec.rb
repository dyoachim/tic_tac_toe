require "./player.rb"
require "./board.rb"

describe Player do

	let!(:board) { Board.new }
	let(:player_x) { Player.new(board, "X")}

	
	it 'marks the board on its turn' do
		Kernel.stub(:gets).and_return(2)

		expect(board.board).not_to include("X")
		player_x.take_turn
		expect(board.board).to include("X")
	end
end