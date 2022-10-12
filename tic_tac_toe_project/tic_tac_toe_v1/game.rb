require_relative "board" #make sure to require the OTHER files so it can grab the other docs
require_relative "human_player"

class Game
    attr_reader :player_1, :player_2, :board, :current_player
    #might not need the attr_writer, but putting it in for now before I forget
    attr_writer :player_1, :player_2, :board, :current_player
    def initialize(player_1_mark, player_2_mark)
        # @player_1_mark = player_1_mark
        # @player_2_mark = player_2_mark
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @board = Board.new()
        @current_player = @player_1
    end

    def switch_turn
        if self.current_player == @player_1
            self.current_player = @player_2
        else
            self.current_player = @player_1
        end
    end

    def play
        while board.empty_positions? #while there are still positions to be filled
            self.board.print
            player_position = self.current_player.get_position
            player_mark_value = self.current_player.mark_value
            self.board.place_mark(player_position,player_mark_value)
            if self.board.win?(player_mark_value)
                self.board.print
                puts "The player with #{player_mark_value} has won"
                return
            else
                self.switch_turn
            end
        end
        self.board.print
        puts "Well fought. It was a draw"
    end

end
