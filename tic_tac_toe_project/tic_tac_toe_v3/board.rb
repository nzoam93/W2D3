class Board
    attr_reader :rows, :cols, :grid
    def initialize(n)
        @rows = n
        @cols = n
        @grid = Array.new(@rows) {Array.new(@cols,"_")}
    end

    def valid?(position) #assuming you are getting passed in an array
        position.none? {|ele| ele >= @grid.length || ele <0} #has to be a positive INTEGER between 0 and row-1
    end

    def empty?(position) #assuming you are passed in an array
        row, col = position
        return @grid[row][col] == "_"
    end

    def place_mark(position,mark)
        row, col = position
        if self.valid?(position) && self.empty?(position)
            @grid[row][col] = mark
        else
            raise "invalid mark"
        end
    end

    def print
        @grid.each do |row|
            p row
            puts
        end
    end

    def win_row?(mark)
        @grid.each do |row|
            if row.all?{|ele| ele == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        @grid.transpose.each do |row|
           if row.all?{|ele| ele == mark}
            return true
           end
        end
        return false
    end

    def win_positive_diagonal?(mark)
        rows, cols = @grid.length, @grid[0].length
        count = 0
        (0...rows).each do |row|
            (0...cols).each do |col|
                count += 1 if @grid[row][col] == mark && row == col
            end
        end
        return count == @grid.length
    end

    def win_negative_diagonal?(mark) #idk if this is a stupid way to do it, but it works
        rows, cols = @grid.length, @grid[0].length
        count = 0
        (0...rows).each do |row|
            (0...cols).each do |col|
                count += 1 if @grid[row][col] == mark && row + col == @grid.length - 1
            end
        end
        return count == @grid.length
    end

    def win_diagonal?(mark)
        return win_negative_diagonal?(mark) || win_positive_diagonal?(mark)
    end

    def win?(mark)
        return win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
    end

    def empty_positions?
        rows, cols = @grid.length, @grid[0].length
        (0...rows).each do |row|
            (0...cols).each do |col|
                return true if empty?([row,col])
            end
        end
        return false
    end

    def legal_positions
        available_positions = []
        rows, cols = @grid.length, @grid[0].length
        (0...rows).each do |row|
            (0...cols).each do |col|
                available_positions << [row, col] if @grid[row][col] == "_"
            end
        end
        return available_positions
    end
end





# board_a = Board.new
# p board_a.grid
# p board_a.valid?([2, 3])
# p board_a.empty?([1,1])
# puts "--------------"

# board_a.place_mark([0,2],"M")
# board_a.place_mark([1,1],"M")
# board_a.place_mark([2,0],"M")

# board_a.print

# p board_a.win_row?("M")
# p board_a.win_col?("M")
# p board_a.win_positive_diagonal?("M")
# p board_a.win_negative_diagonal?("M")

# p board_a.empty_positions?
