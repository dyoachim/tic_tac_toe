require "./player.rb"
require "./board.rb"

describe Player do

	let!(:board) { Board.new }
	let(:player_x) { Player.new(board, "X")}

	#Player.stub(:gets).and_return(2)
	
	it 'marks the board on its turn' do
		expect(board.board).not_to include("X")
		player_x.take_turn
		expect(board.board).to include("X")
	end
end