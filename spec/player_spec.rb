require "./player.rb"
require "./board.rb"

describe Player do

	let!(:board) { Board.new }
	let(:player_x) { Player.new(board, "X")}

	
	it 'marks the board on its turn' do
		expect(player_x).to receive(:get_number).once.and_return(3)

		expect(board.board).not_to include("X")
		player_x.take_turn
		expect(board.board).to include("X")
	end
end