class Square

  attr_reader :position, :occupied_by

  def initialize(position)
    @position = position
    @occupied_by = nil
  end

  def claim(player)
    raise "Square already taken" if occupied?
    @occupied_by = player
  end

  def occupied?
    !!@occupied_by
  end

end
