require 'square'

describe Square do
  let(:player) { instance_double "Player" }
  subject { described_class.new(1) }
  it 'has a position' do
    expect(subject.position).to be 1
  end
  context 'is unoccupied' do
    it 'is unoccupied by default' do
      expect(subject.occupied?).to be false
    end
  end
  context 'is occupied' do
    it 'can be owned by a player' do
      subject.own(player)
      expect(subject.occupied_by).to be player
    end
    it 'becomes occupied once a player has owned it' do
      subject.own(player)
      expect(subject.occupied?).to be true
    end
  end
end
