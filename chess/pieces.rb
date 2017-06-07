require 'singleton'
module SlidingPiece
  def move_straight(current_pos)
    moves = []
    @board.grid.length.times do |i|
      moves << [current_pos.first,i]
      moves << [i,current_pos.last]
    end
    moves
  end
  def move_diagonally(current_pos)
    moves = []
    @board.grid.length.times do |i|
      row_pos = current_pos.first + i
      row_pos %= grid.length-1 if row_pos < grid.length
      col_pos = current_pos.last + i
      col_pos %= grid.length-1 if col_pos < grid.length
      moves << [row_pos,col_pos]
    end
    moves
  end
end

module SteppingPiece
  def king_move(current_pos)
    moves = [1, 0, -1].permutation(2).to_a
    moves + [[1,1]] + [[-1,-1]]
  end

  def knight_move
    moves = [2, 1, -1, -2].permutation(2).to_a.reject {|arr| arr.reduce(:+).zero?}
  end
end

class Piece
  attr_reader :render_img, :color, :current_pos
  def initialize(board, color, current_pos)
    @board = board
    @color = color
    @current_pos = current_pos
  end

  def moves
  end


end

class King < Piece
  include SteppingPiece

  def initialize(board, color, current_pos)
    super
    @render_img = ['♔', '♚']
  end

  def moves
    possible_moves = king_move(@current_pos)
    valid_moves(possible_moves)
  end

  def valid_moves(possible_moves_array)
    valid_arr = []
    possible_moves_array.each do |arr|
      if self.color == @board[[arr.first, arr.last]].color
        next
      else
        valid_arr << arr
      end
    end
    valid_arr.select{|arr| @board.in_bounds?(arr)}
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(board, color, current_pos)
    super
    @render_img = ['♕', '♛']
  end

  def moves
    possible_moves = move_straight(@current_pos) + move_diagonally(@current_pos)
  end
end

class Rook < Piece
  def initialize(board, color, current_pos)
    super
    @render_img = ['♖', '♜']
  end

  def moves
    possible_moves  = move_straight(@current_pos)
  end
end

class Bishop < Piece
  def initialize(board, color, current_pos)
    super
    @render_img = ['♗', '♝']
  end

  def moves
    possible_moves = move_diagonally(@current_pos)
  end
end

class Knight < Piece
  def initialize(board, color, current_pos)
    super
    @render_img= ['♘', '♞']
  end
  def moves
    possible_moves = knight_move(@current_pos)
  end
end

class Pawn < Piece
  def initialize(board, color, current_pos)
    super
    @render_img = ['♙', '♟']
    @start_pos = current_pos
  end

  def moves
    case @color
    when :w
      if @start_pos == @current_pos
        [@current_pos.first, @current_pos.last + 2 ]
      else
        [@current_pos.first, @current_pos.last + 1 ]
      end
    when :b
      if @start_pos == @current_pos
        [@current_pos.first, @current_pos.last - 2 ]
      else
        [@current_pos.first, @current_pos.last - 1 ]
      end
    end
  end
end

class NullPiece < Piece
  include Singleton
  def initialize

  end
end
