require_relative "board.rb"
require_relative "minesweeper.rb"

require 'byebug'
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

  # def change_flag
  #   @flagged ? @flagged = false : @flagged = true
  # end

  def inspect
    if revealed == false
      if flagged == false
        "*"
      else
        "F"
      end
    elsif revealed == true
      if neighbor_bomb_count > 0
        neighbor_bomb_count.to_s
      else
        "_"
      end
    end

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
