def merge(*arr)
  arr.flatten.uniq
end

p merge([1, 3, 5], [7, 8, 9])