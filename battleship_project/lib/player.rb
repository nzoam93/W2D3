class Player
    def get_move
        puts "enter a position with coordinates separated with a space like `4 7'"
        input = gets.chomp
        arr = input.split(" ")
        arr.map! {|ele| ele.to_i}
        #returns something like [4,5]
    end
end
