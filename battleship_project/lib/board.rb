class Board
  def self.print_grid(matrix) #nailed it!
    matrix.each do |row|
      puts row.join(" ")
    end
  end

  attr_reader :size, :grid
  def initialize(n)
    @grid = Array.new(n) {Array.new(n,:P)} #could just set it to :N to begin with
    (0...n).each do |row|
        (0...n).each do |col|
            @grid[row][col] = :N
        end
    end
    @size = n * n
  end

  def [](position)
    return @grid[position[0]][position[1]]
  end

  def []=(position, value)
    row, col = position #since position is a 2-element array, I am just setting row as the first ele, and col as the second ele
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count{|el| el == :S}
  end

  #part 2
  def attack(position)
    if self.[](position) == :S #accessing it. Getter
      self.[]=(position,:H) #actually changing it. Setter
        puts "you sunk my battleship!"
        return true
    else
        self.[]=(position, :X)
        return false
    end
  end

  def place_random_ships
    #board is the instance
    #grid is the variable of board
    #self refers to the board instance (because we are in the board class)
    rows, cols = @grid.length, @grid[0].length
    desired_ships = @size * 0.25

    while self.num_ships < desired_ships
      random_row = rand(0...rows)
      random_col = rand(0...cols)
      random_position = [random_row,random_col]
      self.[]=(random_position, :S) #setter method, so use self.
    end

  end

  def hidden_ships_grid
    n = @grid.length
    new_arr = Array.new(n) {Array.new(n,0)}
    rows, cols = @grid.length, @grid[0].length
    (0...rows).each do |row|
      (0...cols).each do |col|
        if @grid[row][col] == :S
          new_arr[row][col] = :N
        else
          new_arr[row][col] = @grid[row][col]
        end
      end
    end
    return new_arr
  end

  def cheat
    Board.print_grid(@grid) #for class methods, say Class name. For instance methods, say self.
  end

  def print
    Board.print_grid(self.hidden_ships_grid) #self here because it's within a class method?
  end
end

# p 1 + 2
# p 1.+(2) #oooooooooo

# self.[]=(position)
# self[position] =

# board_1 = Board.new(5)
# p board_1.grid
# board_1.[]=([1,2], :M)
# p board_1


  #first attempt. Not using. Above code works better
    # (0...rows).each do |row|
    #   (0...cols).each do |col|
    #     random = rand(1..4)
    #     position = [row][col]
    #     self.[]=(position, :S) if random == 1
    #   end
    # end
