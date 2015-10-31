require_relative "minesweeper.rb"
require_relative "tile.rb"

class Board
  attr_accessor :grid

  def initialize
    @grid = make_grid
    add_bombs
  end

  def make_grid
    empty_grid = Array.new(9) { Array.new(9) }
    fill_grid(empty_grid)
  end

  def fill_grid(empty_grid)
    empty_grid.each_with_index do |row, row_idx|
      row.each_with_index do |col, col_idx|
        empty_grid[row_idx][col_idx] = Tile.new([row_idx, col_idx], self)
      end
    end
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, value)
    x, y = pos
    grid[x][y] = value
  end

  def add_bombs
    idx = 0

    until idx == 9
      x = rand(0..8)
      y = rand(0..8)
      if !grid[x][y].bombed
        grid[x][y].bombed = true
        idx += 1
      end

    end
  end

  def render
    grid.each_with_index do |row, idx1|
      line = []
      row.each_with_index do |col,idx2|
        line << grid[idx1][idx2].inspect
      end
      puts line.join(' ')
      line = []
    end
  end

end

if $PROGRAM_NAME == __FILE__
  board = Board.new
  board.render
end
