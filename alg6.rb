class Test
  def reverse(m)
    i = 1
    j = m
    while i < j
      @p[i], @p[j] = @p[j], @p[i]
      i += 1
      j -= 1
    end
  end

  def antylex(m)
    if m == 1
      puts "Permutacja: #{@p[1..-1]}"
    else
      for i in 1..m
        antylex(m-1)
        if i<m
          @p[i], @p[m] = @p[m], @p[i]
          reverse(m-1)
        end
      end
    end
  end

  def initialize()
    for i in 3..4
      @p = Array.new(i+1){|k| k}
      antylex(i)
      puts
    end
  end
end

Test.new
