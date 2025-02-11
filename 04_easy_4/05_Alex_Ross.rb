def multisum(num)
  (1..num).select { |n| n % 3 == 0 || n % 5 == 0 }.inject(:+)
end

def multisum(num)
  (1.num).select { |n| n % 3 == 0 || n % 5 == 0}.sum
end
