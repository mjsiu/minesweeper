class Tile

  attr_accessor :bombed?, :flagged?, :revealed?

  def initialize(board)
      @board = board
      @bombed? = bombed?
      @flagged? = flagged?
      @revealed? = revealed?
  end




end
