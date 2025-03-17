def twice(num)
  left_half, right_half = num.divmod(10**(num.digits.size / 2))
  left_half == right_half ? num : num * 2
end
