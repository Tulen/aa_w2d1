require_relative 'display.rb'
require_relative 'pieces.rb'
class Board
  attr_reader :board
  FRONT_ROW = Array.new(8, Piece.new)
  BACK_ROW = [
    Piece.new,
    Piece.new,
    Piece.new,
    Piece.new,
    Piece.new,
    Piece.new,
    Piece.new,
    Piece.new,
  ]
  def initialize
    @board = Array.new(8) {Array.new(8, nil)}
    @board[1] = FRONT_ROW
    @board[7] = FRONT_ROW
    @board[0] = BACK_ROW
    @board[8] = BACK_ROW
  end

  def move_piece(start_pos, end_pos)

    # raise 'There is no piece at this position' if @board[a[0].to_i, b[0].to_i].nil?
    #raise 'Invalid move' unless valid_move?

  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos)
    row, col = pos
    @board[row][col] = pos
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
