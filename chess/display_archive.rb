require 'colorize'
require_relative 'cursor'

class Display
  def initialize(board,cursor_pos)
    @board = board
    @cursor = Cursor.new(cursor_pos, board)
  end

  def render

    row_string = ""
    @board.grid.each_with_index do |row, row_idx|
      row.each_with_index do |piece,col_idx|
        if @cursor.cursor_pos == [row_idx,col_idx] # cursor
          if piece.class.superclass == Piece # piece
            if piece.color == :w # color
              if row_idx.even? # background color: row even
                if col_idx.even? # column even
                  row_string << piece.render_img[0].colorize(:color => :red, :background => :cyan)
                else
                  row_string << piece.render_img[0].colorize(:color => :red, :background => :cyan)
                end
              else # row odd
                if col_idx.even? #column even
                  row_string << piece.render_img[0].colorize(:color => :red, :background => :cyan)

                else #column odd
                  row_string << piece.render_img[0].colorize(:color => :red, :background => :cyan)
                end
              end
            else
              row_string << piece.render_img[1].colorize(:red)
            end
          else # no piece
            row_string << "_".red
          end
        else # no cursor
          if piece.class.superclass == Piece # piece
            if piece.color == :w #white
              row_string << piece.render_img[0]
            else # black
              row_string << piece.render_img[1]
            end
          else # no piece
            row_string << "_"
          end
        end

      end
      puts row_string
      row_string = ""
    end

  end
end
