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
    it 'starts with two players' do
      expect(subject.player1.class && subject.player2.class).to be Player
    end
    it 'player one is allocated the symbol "X"' do
      expect(subject.player1.symbol).to be :X
    end
    it 'player two is allocated the symbol "O"' do
      expect(subject.player2.symbol).to be :O
    end
  end
  context 'board' do
    it 'has a board' do
      expect(subject.board.class).to be Board
    end
  end
  context 'turns' do
    it 'starts on player 1\'s turn' do
      expect(subject.current_turn).to be subject.player1
    end
    it 'moves to player 2\'s turn after player 1\'s turn' do
      subject.turn(0)
      expect(subject.current_turn).to be subject.player2
    end
  end
  context 'game over' do
    before do
      9.times do |i|
        subject.turn(i)
      end
    end
    it 'raises an error when trying to take a turn when the game has ended' do
      expect{subject.turn(0)}.to raise_error("Game over")
    end
  end
end
