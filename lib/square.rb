class Square

  attr_reader :position, :occupied_by

  def initialize(position)
    @position = position
    @occupied_by = nil
  end

  def own(player)
    @occupied_by = player
  end

  def occupied?
    !!@occupied_by
  end

end
