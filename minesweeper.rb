class Tile

  attr_accessor :bombed, :flagged, :revealed

  def initialize(board)
      @board = board
      @bombed = bombed
      @flagged = flagged
      @revealed = false
  end

  def reveal
    @revealed = true
  end

  POSSIBLE_MOVES = [[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1]]


  def neighbors(pos)
    possible_neighbors = []
    # it needs to find all of this tile's neighbors





  end





end
