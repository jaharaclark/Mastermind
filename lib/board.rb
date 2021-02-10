require './lib/globe'

class Board
  attr_reader :color,
              :index
  def initialize(color, index)
  @color = color
  @index = index
  end
end
