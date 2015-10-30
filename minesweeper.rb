class Tile

  attr_accessor :bombed, :flagged, :revealed

  def initialize(board)
      @board = board
      @bombed = false
      @flagged = false
      @revealed = false
  end

  def reveal
    @revealed = true
  end

  POSSIBLE_MOVES = [[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1]]


  def neighbors(pos)
    possible_neighbors = []
    # it needs to find all of this tile's neighbors
    POSSIBLE_MOVES.each do |pos_move|
      valid_move = [(pos[0] + pos_move[0]), (pos[1] + pos_move[1])]
      possible_neighbors << valid_move 
    end
  end





end
