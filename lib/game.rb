require_relative 'board'

class Game

  SYMBOLS = %i{X O}.freeze
  PLAYER1 = SYMBOLS[0]
  PLAYER2 = SYMBOLS[1]

  def initialize(board_klass=Board)
    @players = [PLAYER1, PLAYER2]
    @board = board_klass.new
  end

  def current_turn
    players.first
  end

  def turn(position)
    raise "Game over" if game_over?
    board.mark_square(current_turn, position)
    players.reverse!
    announce_winner if winner?
  end

  private

  attr_reader :players, :board

  def announce_winner
    "#{board.check(players).to_s} wins!"
  end

  def winner?
    board.check(players) != nil
  end

  def game_over?
    board.full? || winner?
  end

end
