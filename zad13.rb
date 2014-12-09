class Strainer


  def first_strainer(number)
    for i in 0..@u.length-1
      if i+1 <= @u.length-1
        for j in i+1..@u.length-1
          if number == @u[i] + @u[j]
            return second_strainer(number)
          end
        end
      end
    end
    first_strainer(number+1)
  end

  def second_strainer(number)
    counter = 0
    for i in 0..@u.length-1
      if i+1 <= @u.length-1
        for j in i+1..@u.length-1
          if number == @u[i] + @u[j]
            counter += 1
          end
        end
      end
    end
    @u.push number if counter == 1
    if number == @max
      puts @u.to_s
    else
      first_strainer(number+1)
    end
  end

  def initialize()
    @max = 500
    @numbers = Array (1..@max)
    @u = [1,2]
    first_strainer(3)
  end

end

Strainer.new
