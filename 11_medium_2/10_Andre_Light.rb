def sum_squared(n)
  (1..n).sum**2
end

def squared_sum(n)
  (1..n).sum(&:abs2)
end

def sum_square_difference(n)
  sum_squared(n) - squared_sum(n)
end
