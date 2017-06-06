require 'singleton'
module SlidingPiece
  def move_dirs

  end
end

module SteppingPiece

end

class Piece
  attr_reader :render_img
  def initialize(board, color)
    @board = board
    @color = color
  end

  def moves
  end


end

class King < Piece
  def initialize(board, color)
    super
    @render_img = ['♔','♚']
  end
end
class Queen < Piece
  def initialize(board, color)
    super
    @render_img = ['♕', '♛']
  end
end
class Rook < Piece
  def initialize(board, color)
    super
    @render_img = ['♖', '♜']
  end
end
class Bishop < Piece
  def initialize(board, color)
    super
    @render_img = ['♗','♝']
  end
end
class Knight < Piece
  def initialize(board, color)
    super
    @render_img= ['♘','♞']
  end
end
class Pawn < Piece
  def initialize(board, color)
    super
    @render_img = ['♙','♟']
  end
end

class NullPiece < Piece
  include Singleton
  def initialize(board, color)
    super
    @symbol
  end
end
