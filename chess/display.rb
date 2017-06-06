require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :cursor
  def initialize(board,cursor_pos)
    @board = board
    @cursor = Cursor.new(cursor_pos, board)
  end

  def render

    row_string = ""
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece,col_idx|
        if @cursor.cursor_pos == [row_idx,col_idx]
          if piece.class.superclass == Piece
            if piece.color == :w
              row_string << piece.render_img[0].colorize(:red)
            else
              row_string << piece.render_img[1].colorize(:red)
            end
          else
            row_string << "_".red
          end
        else
          if piece.class.superclass == Piece
            if piece.color == :w
              row_string << piece.render_img[0]
            else
              row_string << piece.render_img[1]
            end
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
