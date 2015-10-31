require_relative "board.rb"
require_relative "tile.rb"

class Game
  def initialize
    @board = Board.new
  end

  def get_move
    prompt "Pick a move row, col"
    gets.
  end


end
