class Gomoku

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

  def check_right(x, y)
    sign = @board[[x,y]][0]
    for i in 1..4
      if @board[[x+i, y]].nil? || @board[[x+i,y]][0] != sign
        return false
      end
    end
    (!@board[[x+5, y]].nil? && @board[[x+5,y]][0] == sign) ? false : true
  end

  def check_top(x, y)
    sign = @board[[x,y]][0]
    for i in 1..4
      if @board[[x, y+i]].nil? || @board[[x,y+i]][0] != sign
        return false
      end
    end
    (!@board[[x, y+5]].nil? && @board[[x,y+5]][0] == sign) ? false : true
  end

  def check_cross_right(x, y)
    sign = @board[[x,y]][0]
    for i in 1..4
      if @board[[x+i, y+i]].nil? || @board[[x+i,y+i]][0] != sign
        return false
      end
    end
    (!@board[[x+5, y+5]].nil? && @board[[x+5,y+5]][0] == sign) ? false : true
  end

  def check_cross_left(x, y)
    sign = @board[[x,y]][0]
    for i in 1..4
      if @board[[x-i, y+i]].nil? || @board[[x-i,y+i]][0] != sign
        return false
      end
    end
    (!@board[[x-5, y+5]].nil? && @board[[x-5,y+5]][0] == sign) ? false : true
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

  def check_win()
    for i in 1..@max
      for j in 1..@max
        if @board[[i,j]][0] != 0 && (check_right(i,j) || check_cross_left(i,j) || check_cross_right(i,j) || check_top(i,j))
          print_end()
          return true
        end
      end
    end
    false
  end

  def check_possibilities(current,sign)
    for i in 1..@max
      for j in 1..@max
        #puts @board[current][1].get_block
        #puts (@board[current][1].is_not_blocked? [i,j])
        if @board[[i,j]][0] == 0 && (@board[current][1].is_not_blocked? [i,j])
          return false
        end
      end
    end
    true
  end

  def return_moves()
    move = @move_stack.pop
    @board[move][0] = 0
    denied = true
    while denied == true do
      forbidden = @move_stack.pop
      @board[forbidden][1].block move
      @board[@move_stack[-1]][1].block forbidden
      puts @board[@move_stack[-1]][1].get_block
      sign_to_place = @board[forbidden][0]
      @board[forbidden][0] = 0
      denied = check_possibilities(@move_stack[-1], sign_to_place)
      move = forbidden
      #puts "return"
    end
    #run_iterative_algorithm(@move_stack[-1], sign_to_place)
  end

  def run_iterative_algorithm(current_move, sign)
    #puts current_move
    #puts sign.to_s
    win = false
    for i in 1..@max
      for j in 1..@max
        if @board[[i,j]][0] == 0 && (@board[current_move][1].is_not_blocked? [i,j])
          @board[[i,j]][0] = sign
          @move_stack.push [i,j]
          sign = sign == 1 ? 2 : 1
          win = check_win()
          if !win && @move_stack.length == @max**2
            return_moves()
          else
            return if win
          end
        end
      end
    end
  end

  def run_randomized_algorithm()
    current_sign = 1
    win = false
    while !win do
      val = [0,0]
      while val == [0,0] || @board[val][0] != 0 do
        val = [rand(@max)+1,rand(@max)+1]
      end
      @board[val][0] = current_sign
      @move_stack.push val
      current_sign = current_sign == 1 ? 2 : 1
      win = check_win()
      if !win && @move_stack.length == @max**2
        puts "returning"
        return_moves()
      end
    end
  end

  def initialize()
    @board = Hash.new
    @move_stack = Array.new
    @max = 7
    for i in 1..@max
      for j in 1..@max
        @board[[i,j]] = [0,Blocked.new]
      end
    end
    #run_iterative_algorithm([1,1], 1)
    run_randomized_algorithm()
  end

end

Gomoku.new
