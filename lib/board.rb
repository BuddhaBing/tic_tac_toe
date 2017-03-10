require_relative 'square'

class Board

  attr_reader :grid

  GRID_ROWS = 3
  GRID_COLUMNS = GRID_ROWS

  def initialize(square_klass=Square)
    @square_klass = square_klass
    @grid = []
    create_grid
  end

  def mark_square(player, position)
    grid.flatten[position].claim(player)
  end

  def full?
    grid.flatten.all?(&:occupied?)
  end

  def check(players)
    players.each do |player|
      return player if (0..2).collect { |i| grid[0][i] }.all? { |x| x.occupied_by == player } # top row
      return player if (0..2).collect { |i| grid[1][i] }.all? { |x| x.occupied_by == player } # middle row
      return player if (0..2).collect { |i| grid[2][i] }.all? { |x| x.occupied_by == player } # bottom row
      return player if (0..2).collect { |i| grid[i][0] }.all? { |x| x.occupied_by == player } # top row
      return player if (0..2).collect { |i| grid[i][1] }.all? { |x| x.occupied_by == player } # middle row
      return player if (0..2).collect { |i| grid[i][2] }.all? { |x| x.occupied_by == player } # bottom row
      return player if (0..2).collect { |i| grid[i][i] }.all? { |x| x.occupied_by == player } # diagnal top left - bottom right
      return player if (0..2).collect { |i| grid.reverse[i][i] }.all? { |x| x.occupied_by == player } # diagnal bottom left - top right
    end
    nil
  end

  private

  def create_grid
    GRID_ROWS.times do
      row = []
        GRID_COLUMNS.times do |i|
          n = grid.flatten.size + i
          row << @square_klass.new(n)
        end
      grid << row
    end
  end

end
