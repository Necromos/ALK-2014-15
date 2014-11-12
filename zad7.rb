class Zad7

  def move_forward(j,k)
    if @next[k] == 0
      @next[k] = j
      @prev[j] = k
      @next[j] = 0
    end
    if @next[k] > j
      @prev[j] = k
      @next[j] = @next[k]
      @prev[@next[j]] = j
      @next[k] = j
    end
    @blok[j] = @next[k]
  end

  def move_backward(j,k)
    @blok[j] = @prev[k]
    if k == j
      if @next[k] == 0
        @next[@prev[k]] == 0
      else
        @next[@prev[k]] = @next[k]
        @prev[@next[k]] = @prev[k]
      end
    end
  end

  def generate_subsets(m)
    j = m
    k = @blok[j]
    if @pr[j]
      move_forward(j,k)
    else
      move_backward(j,k)
    end
    puts "Podzbiór: #{@blok[1..-1]}"
    generate_subsets(m-1)
  end

  def initialize()
    @m = 3
    @prev = Array (0..@m+1)
    @next = Array (0..@m+1)
    @blok = Array (0..@m)
    @pr = Array.new(@m+1){true}
    @next[1] = 0
    puts "Podzbiór: #{@blok[1..-1]}"
    generate_subsets(@m)
  end
end

Zad7.new
