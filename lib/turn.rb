class Turn
  attr_reader :board_comp, :board_user
  
  def initialize(board_comp, board_user)
    @board_comp = board_comp
    @board_user = board_user
  end
end
