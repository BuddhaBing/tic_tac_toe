require_relative 'board'
require_relative 'player'

class Game

  attr_reader :player1, :player2, :board

  SYMBOLS = %i{X O}.freeze

  def initialize(player_klass=Player, board_klass=Board)
    @player1 = player_klass.new(SYMBOLS[0])
    @player2 = player_klass.new(SYMBOLS[1])
    @players = [@player1, @player2]
    @board = board_klass.new
  end

  def current_turn
    @players.first
  end

  def turn(position)
    raise "Game over" if game_over?
    @board.mark_square(current_turn, position)
    @players.reverse!
  end

  private

  def game_over?
    @board.grid.flatten.all?(&:occupied?)
  end

end
