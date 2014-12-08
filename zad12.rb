class Stamps

  def check(p)
    i = -1
    j = 0
    while true do
      if p >= @stamps[i] && j <= @m
        p = p - @stamps[i]
        j += 1
      else
        i -= 1
        return false if j > @m
        return true if p == 0 && j <= @m
      end
    end
  end

  def find_stamps()
    @stamps = Array.new
    @stamps.push 1
    i = 1 * @m + 1
    @stamps.push i
    i += 1
    while true do
      check(i) ? i += 1 : @stamps.push(i); i += 1
      break if !@stamps[@n-1].nil?
    end
    puts @stamps.to_s
    while true do
      check(i) ? i += 1 : break
    end
    puts "Max:" + i.to_s
  end


  def initialize()
    @m = 10
    @n = 6
    find_stamps()
  end

end

Stamps.new
