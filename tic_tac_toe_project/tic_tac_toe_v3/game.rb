require_relative "board" #make sure to require the OTHER files so it can grab the other docs
require_relative "human_player"
require_relative "computer_player"

class Game
    attr_reader :option_hash, :board, :current_player
    #might not need the attr_writer, but putting it in for now before I forget
    attr_writer :option_hash, :board, :current_player
    def initialize(board_size, option_hash) #key is the mark, value is whether computer or human
        @option_hash = option_hash
        @players = []
        @option_hash.each do |player_mark, computer|
            if computer
                @players << ComputerPlayer.new(player_mark)
            else
                @players << HumanPlayer.new(player_mark)
            end
        end

        @board = Board.new(board_size)
        @current_player = @players[0]
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while board.empty_positions? #while there are still positions to be filled
            self.board.print
            player_position = self.current_player.get_position(self.board.legal_positions)
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
