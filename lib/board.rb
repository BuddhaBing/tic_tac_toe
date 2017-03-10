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
    @grid.flatten[position].claim(player)
  end

  private

  def create_grid
    GRID_ROWS.times do
      row = []
        GRID_COLUMNS.times do |i|
          n = @grid.flatten.size + i
          row << @square_klass.new(n)
        end
      @grid << row
    end
  end

end
