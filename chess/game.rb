require_relative "board"

class Game

  def initialize
    @board = Board.new
    # @player = Player.new
  end

  def play
    play_turn until false
  end

  def play_turn
    system('clear')
    @board.display.render
    @board.display.cursor.get_input
    system('clear')
    @board.display.render
  end

  def won?

  end


end




a = Game.new
a.play
