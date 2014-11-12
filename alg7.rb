class Alg7
  def B(m,i)
    if m % 2 == 0 && m > 2
      i < m-1 ? i : m-2
    else
      m-1
    end
  end

  def perm(m)
    if m == 1
      puts "Permutacja: #{@p[1..-1]}"
    else
      for i in 1..m
        perm(m-1)
        temp = B(m,i)
        @p[temp], @p[m] = @p[m], @p[temp]
      end
    end
  end

  def initialize()
    for i in 3..4
      @p = Array.new(i+1){|k| k}
      perm(i)
      puts
    end
  end
end

Alg7.new
