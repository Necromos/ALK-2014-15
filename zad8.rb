class Zad8

  def gen(n,k,b)
    if k == 1
      @a[k] = n
      puts "#{@a[1..-1]}"
    else
      if b
        for i in 0..n
          @a[k] = i
          gen(n-i,k-1,b)
          b = !b
        end
      else
        b == true if n % 2 == 0
        n.downto(0) { |i|
          @a[k] = i
          gen(n-i,k-1,b)
          b = !b
        }
      end
    end
  end

  def initialize()
    @n = 5
    @k = 3
    @a = Array.new(@k) { 0 }
    gen(@n,@k,true)
  end

end

Zad8.new
