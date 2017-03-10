require_relative 'board'
require_relative 'player'

class Game

  SYMBOLS = %i{X O}.freeze

  def initialize(player_klass=Player, board_klass=Board)
    player1 = player_klass.new(SYMBOLS[0])
    player2 = player_klass.new(SYMBOLS[1])
    @players = [player1, player2]
    @board = board_klass.new
  end

  def current_turn
    players.first
  end

  def turn(position)
    raise "Game over" if game_over?
    board.mark_square(current_turn, position)
    players.reverse!
    winner
  end

  private

  attr_reader :players, :board

  def winner
    board.check(players)
  end

  def game_over?
    board.full? || winner
  end

end
