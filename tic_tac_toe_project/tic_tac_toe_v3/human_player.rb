class HumanPlayer
    attr_reader :mark_value
    def initialize(mark_value)
        @mark_value = mark_value
    end

    def get_position_actual(legal_positions)
        puts "Please enter a valid row col position"
        puts "The current player has the #{mark_value} piece"
        position_input = gets.chomp.split(" ")
        position_input.map! {|ele| ele.to_i} #makes it integers, not strings
        if !legal_positions.include?(position_input)
            raise "Please choose a legal selection"
        end
        return position_input #need to return it here!

        # p position_input
    end

    def get_position(legal_positions) #rescues the get_position_actual!
        begin
            get_position_actual(legal_positions)
        rescue
            puts "Please choose a legal selection. RESCUE RETRY"
            retry
        end
    end
end
