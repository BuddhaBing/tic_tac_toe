require 'player'

describe Player do
  it 'initializes with the default symbol "X"' do
    expect(subject.symbol).to be :X
  end
  it 'allows to select the symbol "O" at initialization' do
    player = Player.new(:O)
    expect(player.symbol).to be :O
  end
end
