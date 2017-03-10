require 'board'

describe Board do
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
end
