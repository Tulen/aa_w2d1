require_relative 'display.rb'
require_relative 'pieces.rb'
class Board
  attr_reader :grid
  FRONT_ROW_B = Array.new(8, Pawn.new(self,:b))
  BACK_ROW_B = [
    Rook.new(self,:b),
    Knight.new(self,:b),
    Bishop.new(self,:b),
    Queen.new(self,:b),
    King.new(self,:b),
    Bishop.new(self,:b),
    Knight.new(self,:b),
    Rook.new(self,:b),
  ]
  FRONT_ROW_W= Array.new(8, Pawn.new(self,:w))
  BACK_ROW_W = [
    Rook.new(self,:w),
    Knight.new(self,:w),
    Bishop.new(self,:w),
    Queen.new(self,:w),
    King.new(self,:w),
    Bishop.new(self,:w),
    Knight.new(self,:w),
    Rook.new(self,:w),
  ]
  def initialize
    @grid = Array.new(8) {Array.new(8, nil)}
    @grid[1] = FRONT_ROW_W
    @grid[7] = FRONT_ROW_B
    @grid[0] = BACK_ROW_W
    @grid[8] = BACK_ROW_B
  end

  def move_piece(start_pos, end_pos)

    # raise 'There is no piece at this position' if @grid[a[0].to_i, b[0].to_i].nil?
    #raise 'Invalid move' unless valid_move?

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos)
    row, col = pos
    @grid[row][col] = pos
  end

  def in_bounds?(pos)
    position.each do |x|
      if x > 8 || x < 0
        return false
      end
    end
    true
  end

end
