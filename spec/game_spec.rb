require 'game'

describe Game do
  context 'symbols' do
    it 'has the symbol "X"' do
      expect(described_class::SYMBOLS.include?(:X)).to be true
    end
    it 'has the symbol "O"' do
      expect(described_class::SYMBOLS.include?(:O)).to be true
    end
  end
  context 'players' do
    it 'player one is allocated the symbol "X"' do
      expect(subject.current_turn.symbol).to be :X
    end
    it 'player two is allocated the symbol "O"' do
      subject.turn(0)
      expect(subject.current_turn.symbol).to be :O
    end
  end
  context 'turns' do
    it 'starts on player 1\'s turn' do
      player1 = subject.current_turn
      expect(subject.current_turn).to be player1
    end
    it 'moves to player 2\'s turn after player 1\'s turn' do
      player1 = subject.current_turn
      subject.turn(0)
      expect(subject.current_turn).not_to be player1
    end
  end
  context 'game over' do
    before do
      7.times do |i|
        subject.turn(i)
      end
    end
    it 'raises an error when trying to take a turn when the game has ended' do
      expect{subject.turn(0)}.to raise_error("Game over")
    end
  end
  context '#winner' do
    it 'returns nil if there is no winner yet' do
      expect(subject.turn(0)).to eq nil
    end
    it 'returns the winner' do
      subject.turn(8)
      subject.turn(0)
      subject.turn(3)
      subject.turn(1)
      subject.turn(5)
      expect(subject.turn(2).class).to eq Player
    end
  end
end
