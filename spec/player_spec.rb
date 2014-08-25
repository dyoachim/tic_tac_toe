require "./app/models/player.rb"
require "./app/models/board.rb"

describe Player do

  let!(:board) { Board.new }
  let(:player) { Player.new(board, "X")}

	
  it 'has a letter' do
    expect(player.letter).to eq("X")
  end

  it 'responds to #take_turn' do
    expect(player).to respond_to(:take_turn)
  end
end