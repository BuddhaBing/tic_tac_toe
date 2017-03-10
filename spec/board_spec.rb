require 'board'

describe Board do
  let(:player) { instance_double "Player" }
  let(:square) { instance_double "Square" }
  it 'has a grid row size of three' do
    expect(described_class::GRID_ROWS).to be 3
  end
  it 'has a grid column size of three' do
    expect(described_class::GRID_COLUMNS).to be 3
  end
  it 'creates a grid/array of 9 squares' do
    expect(subject.grid.flatten.size).to be 9
  end
  context '#mark_square' do
    it 'marks a square in the grid as claimed by a player' do
      subject.mark_square(player,0)
      expect(subject.grid.flatten.first).to be_occupied
    end
  end
end
