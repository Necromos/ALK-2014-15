class Pattern

  def initialize()
    t = "fahrwe sfagfahr"
    p = "fahr"
    puts "T string: " + t
    puts "P pattern: " + p
    n = t.length
    m = p.length
    j = 0
    #puts t[10].to_s
    for i in 0..n-1
      #puts i.to_s + " " + j.to_s
      if j == m-1
        puts "Found match at pos: " + (i-j).to_s
        j = 0
        next
      end
      if t[i] != p[j]
        i = i + m - 1 - j
        j = 0
      else
        j += 1
      end
    end
  end

end

Pattern.new
