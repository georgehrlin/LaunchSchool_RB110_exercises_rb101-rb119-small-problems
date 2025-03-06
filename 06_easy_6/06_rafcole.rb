def merge(*arr)
  arr.reduce(:|)
end

p merge([1, 3, 5], [7, 8, 9])
