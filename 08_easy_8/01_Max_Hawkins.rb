def sum_of_sums(nums)
  sum = 0
  nums.map { |num| sum += num }.reduce(:+)
end
