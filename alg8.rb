class MobileInteger
  attr_reader :direction, :number
  attr_writer :direction, :number

  def initialize(direction, number)
    @direction = direction
    @number = number
  end
end

def perms(n)
  p = Array.new
  for i in 0..n
    p.push MobileInteger.new -1, i
  end
  c = 1
  loop do
    yield c, p[1..-1].map{|element| element.number}, p[1..-1].map{|element| element.direction}
    c += 1
    k = 0
    for i in 2..n
      k = i if p[i].direction == -1 && p[i].number > p[i-1].number && p[i].number > p[k].number
    end
    for i in 1...n
      k = i if p[i].direction == 1 && p[i].number > p[i+1].number &&  p[i].number > p[k].number
    end
    break if k.zero?
    for i in 1..n
      p[i].direction *= -1 if p[i].number > p[k].number
    end
    i = k + p[k].direction
    p[k], p[i] = p[i], p[k]
  end
end

for i in 3..5
  perms(i){|c, perm, dir| puts "Nr. #{c} Permutacja: #{perm} Ruch: #{dir}"}
  puts
end
