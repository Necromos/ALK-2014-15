class Alg13

  def printit(d)
    str = ""
    #puts @s
    for i in 1..d
      #puts "in #{@r[0]} #{@s[0]} "
      if @r[i] > 1
        for j in 1..@r[i]
          #puts "#{@s[i]} występuje #{@r[i]} razy"
          str = str + @s[i].to_s
        end
      else
        str = str + @s[i].to_s
      end
    end
    puts str
  end

  def divset(n)
    @s[1] = n
    @r[1] = 1
    d = 1
    l = 0
    printit d
    while @s[1] > 1 do
      sum = 0
      #puts "#{d}"
      if @s[d] == 1 # ob2
        sum += @r[d] # ob2 sum = 1
        d -= 1 # ob2 d = 1
      end
      sum += @s[d] # sum = 5 # ob2 sum = 5
      @r[d] -= 1 # @r[1] = 0 # ob2 @r[1] = 0
      l = @s[d] - 1 # l = 4 # ob2 l = 3
      d += 1 if @r[d] > 0
      @s[d] = l # @s[1] = 4 # ob2 @s[1] = 3
      @r[d] = sum / l # @r[1] = 1 # ob2 @r[1] = 1
      l = sum % l # l = 1 # ob2 l = 2
      if l != 0
        d += 1 # d = 2 # ob2 d = 2
        @s[d] = l # @s[2] = 1 #
        @r[d] = 1 # @r[2] = 1
      end
      #puts "#{d}"
      #puts "#{@s}"
      #puts "#{@r}"
      printit(d)
    end
  end

  def initialize()
    @n = 10
    @s = Array.new(@n+1)
    @r = Array.new(@n+1) { 0 }
    #puts "#{@r}"
    divset(@n)
  end

end

Alg13.new
