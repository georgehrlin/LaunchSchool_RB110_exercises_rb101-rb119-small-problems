def find_fibonacci_index_by_length(digits)
  target_number = 10 ** (digits - 1)
  recent_nums = [1, 1]
  idx = 2

  while recent_nums[1] < target_number
    num = recent_nums.reduce(:+)
    recent_nums.push(num).shift
    idx += 1
  end

  idx
end

