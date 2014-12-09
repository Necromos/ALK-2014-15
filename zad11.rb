class String
  def numeric?
    return true if self =~ /^\d+$/
    true if Float(self) rescue false
  end
end

class Nurikabe

  class Blocked

    def block(val)
      @block[val] = true
    end

    def get_block
      @block
    end

    def is_not_blocked?(val)
      !@block.key? val
    end

    def initialize()
      @block = Hash.new
    end

  end

  def print_end()
    str = ""
    for i in 1..@max
      for j in 1..@max
        str = str + @board[[i,j]][0].to_s + " "
      end
      str = str + "\n"
    end
    puts str
  end

  def is_availeable?(current)
    
  end

  def return_moves()
    move = @move_stack.pop
    @board[move][0] = 'X'
    denied = true
    while denied == true do
      forbidden = @move_stack.pop
      @board[forbidden][1].block move
      @board[@move_stack[-1]][1].block forbidden
      puts @board[@move_stack[-1]][1].get_block
      sign_to_place = @board[forbidden][0]
      @board[forbidden][0] = 'X'
      denied = check_possibilities(@move_stack[-1], sign_to_place)
      move = forbidden
    end
  end

  def find_road(start_pos)
    size_of_island = @board[start_pos][0]
    for i in 1..size_of_island
      is_availeable?()
    end
  end

  def check_for_solution()
    for i in 1..@max
      for j in 1..@max
        find_road([i,j]) if @board[[i,j]][0].numeric?
      end
    end
    print_end()
  end

  def fill_board()
    @board[[1,2]][0] = 1
    @board[[3,1]][0] = 3
    @board[[5,1]][0] = 3
    @board[[1,4]][0] = 1
    @board[[3,5]][0] = 3
  end

  def initialize()
    @board = Hash.new
    @move_stack = Array.new
    @max = 5
    for i in 1..@max
      for j in 1..@max
        @board[[i,j]] = ['X',Blocked.new]
      end
    end
    fill_board()
    check_for_solution()
  end

end

Nurikabe.new
