require_relative 'display.rb'
require_relative 'pieces.rb'
class Board
  attr_reader :grid, :display

  FRONT_ROW_B = [
    Pawn.new(self,:b, [6,0]),
    Pawn.new(self,:b, [6,1]),
    Pawn.new(self,:b, [6,2]),
    Pawn.new(self,:b, [6,3]),
    Pawn.new(self,:b, [6,4]),
    Pawn.new(self,:b, [6,5]),
    Pawn.new(self,:b, [6,6]),
    Pawn.new(self,:b, [6,7]),
  ].freeze
  BACK_ROW_B = [
    Rook.new(self,:b, [7,0]),
    Knight.new(self,:b, [7,1]),
    Bishop.new(self,:b, [7,2]),
    Queen.new(self,:b, [7,3]),
    King.new(self,:b, [7,4]),
    Bishop.new(self,:b, [7,5]),
    Knight.new(self,:b, [7,6]),
    Rook.new(self,:b, [7,7]),
  ].freeze
  FRONT_ROW_W = [
    Pawn.new(self,:w, [1,0]),
    Pawn.new(self,:w, [1,1]),
    Pawn.new(self,:w, [1,2]),
    Pawn.new(self,:w, [1,3]),
    Pawn.new(self,:w, [1,4]),
    Pawn.new(self,:w, [1,5]),
    Pawn.new(self,:w, [1,6]),
    Pawn.new(self,:w, [1,7]),
  ].freeze
  BACK_ROW_W = [
    Rook.new(self,:w, [0,0]),
    Knight.new(self,:w, [0,1]),
    Bishop.new(self,:w, [0,2]),
    Queen.new(self,:w, [0,3]),
    King.new(self,:w, [0,4]),
    Bishop.new(self,:w, [0,5]),
    Knight.new(self,:w, [0,6]),
    Rook.new(self,:w, [0,7]),
  ].freeze
  def initialize
    @grid = Array.new(8) {Array.new(8, NullPiece.instance)}
    @grid[1] = FRONT_ROW_W
    @grid[6] = FRONT_ROW_B
    @grid[0] = BACK_ROW_W
    @grid[7] = BACK_ROW_B
    @display = Display.new(self,[0,0])
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
    pos.each do |x|
      if x > 7 || x < 0
        return false
      end
    end
    true
  end

end
