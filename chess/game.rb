# class Game
#
#   def initialize
#     @board = Board.new
#     @player = Player.new
#   end
#
#   def play
#     play_turn until won?
#
#   end
#
#   def play_turn
#
#   end
#
#   def won?
#   end
#
#
# end




load "board.rb"
load "display.rb"
load "cursor.rb"
a = Board.new
c = Cursor.new([0,0],a)
b = Display.new(a,c.cursor_pos)
b.render
