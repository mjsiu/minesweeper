class Tile

  attr_accessor :bombed, :flagged, :revealed, :pos

  POSSIBLE_MOVES = [[-1,0],[-1,1],[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1]]

  def initialize(pos, board)
      @pos = pos
      @board = board
      @bombed = false
      @flagged = false
      @revealed = false
  end

  def reveal
    @revealed = true
  end

  def flagged
    @flagged ? @flagged = false : @flagged = true
  end


  def neighbors(pos)
    possible_neighbors = []
    # it needs to find all of this tile's neighbors
    POSSIBLE_MOVES.each do |pos_move|
      valid_move = [(pos[0] + pos_move[0]), (pos[1] + pos_move[1])]
      possible_neighbors << valid_move
    end

    valid_neighbors = []
    possible_neighbors.each do |valid_move|
      if valid_move.all? { |coord| coord.between?(0,8) }
        valid_neighbors << valid_move
      end
    end
    valid_neighbors

  end

  def neighbor_bomb_count
    valid_neighbors =  neighbors(pos)
    bombs = []
    valid_neighbors.each do |tile|
      if tile.bombed
        bombs << tile
      end
    end

    bombs.count
  end
end


class Board
  attr_accessor :grid

  def initialize
    @grid = make_grid
  end

  def make_grid
    empty_grid = Array.new(9) { Array.new(9) }
    fill_grid(empty_grid)

  end

  def fill_grid(empty_grid)

    empty_grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        empty_grid[row][col] = Tile.new([row_idx, col_idx], self)
      end
    end
  end






end

class Game

end
