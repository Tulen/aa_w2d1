require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board,cursor_pos)
    @board = board
    @cursor = Cursor.new(cursor_pos, board)
  end

  def render

    row_string = ""
    @board.board.each_with_index do |row, row_idx|
      row.each_with_index do |piece,col_idx|
        if @cursor.cursor_pos == [row_idx,col_idx]
          if piece.class == Piece
            row_string << piece.render_img.red
            # row_string << "P".red
          else
            row_string << "_".red
          end
        else
          if piece.class == Piece
            # row_string << "P"
            row_string << piece.render_img
          else
            row_string << "_"
          end
        end

      end
      puts row_string
      row_string = ""
    end

  end
end
