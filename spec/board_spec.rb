require 'board'

describe Board do
  let(:player) { instance_double "Player" }
  let(:player2) { instance_double "Player" }
  let(:players) { [player, player2] }
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
  context '#full?' do
    it 'returns false if the board is not fully occupied' do
      expect(subject.full?).to be false
    end
    it 'returns true if the board is fully occupied' do
      9.times do |i|
        subject.mark_square(player, i)
      end
      expect(subject.full?).to be true
    end
  end
  context '#check' do
    it 'returns nil if it is not a winning board' do
      expect(subject.check(players)).to be nil
    end
    it 'is a winning board if the top row is claimed by one player' do
      (0..2).collect { |i| subject.grid[0][i].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the middle row is claimed by one player' do
      (0..2).collect { |i| subject.grid[1][i].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the bottom row is claimed by one player' do
      (0..2).collect { |i| subject.grid[2][i].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the left column is claimed by one player' do
      (0..2).collect { |i| subject.grid[i][0].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the middle column is claimed by one player' do
      (0..2).collect { |i| subject.grid[i][1].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the right column is claimed by one player' do
      (0..2).collect { |i| subject.grid[i][2].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the diagnal (top left to bottom right) is claimed by one player' do
      (0..2).collect { |i| subject.grid[i][i].claim(player) }
      expect(subject.check(players)).to be player
    end
    it 'is a winning board if the diagnal (bottom left to top right) is claimed by one player' do
      (0..2).collect { |i| subject.grid.reverse[i][i].claim(player) }
      expect(subject.check(players)).to be player
    end
  end
end
