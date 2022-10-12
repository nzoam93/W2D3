# class HumanPlayer
#     attr_reader :mark_value
#     def initialize(mark_value)
#         @mark_value = mark_value
#     end

#     def get_position_actual
#         puts "Please enter a valid row col position"
#         puts "The current player has the #{mark_value} piece"
#         position_input = gets.chomp.split(" ")
#         if position_input.length != 2
#             raise "Input must be two numbers"
#         end
#         position_input.map! {|ele| ele.to_i} #makes it integers, not strings
#         p position_input
#     end

#     def get_position #rescues the get_position_actual!
#         begin
#             get_position_actual
#         rescue
#             puts "Input must be two numbers. RESCUE RETRY"
#             retry
#         end
#     end
# end

# def prac2(board_size, *player_marks)
#     players = []
#     player_marks.each do |player_mark|
#         players << HumanPlayer.new(player_mark)
#     end
#     players
# end

# p prac2(2,:O,:X)

arr = [1,2,3,4]
p arr.rotate!
