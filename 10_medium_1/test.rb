def fi(nth)
  (3..nth).reduce([1, 1]) { |(a, b), _| [b] + [(a + b)] }.last
end

p fi(3)