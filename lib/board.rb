require './lib/globe'

class Board
  attr_reader :globes
  def initialize(globes)
    @globes = globes
  end
end
