#duck typing the same methods into computer player so that they can be used later

class ComputerPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position(legal_positions)
        # randRow = rand(0...(legal_positions.length ** 0.5))
        # randCol = rand(0...(legal_positions.length ** 0.5))
        # computerPosition = [randRow,randCol]
        computerPosition = legal_positions.sample
        puts "Computer mark is #{mark_value}"
        puts "Computer chose the position of #{computerPosition}"
        return computerPosition
    end

end

# load 'computer_player.rb'
# hal_9000 = ComputerPlayer.new(:Y)
# positions = [[1, 2], [3, 4], [4, 3]]
# hal_9000.get_position(positions)
# hal_9000.get_position(positions)
