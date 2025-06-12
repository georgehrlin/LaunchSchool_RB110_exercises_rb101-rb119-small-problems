def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 # FURTHER EXPLORATION
end

p valid_series?([5, 6, 2, 7, 3, 12, 4, 8])        # should return true
p valid_series?([1, 12, 2, 5, 16, 6])             # should return false
p valid_series?([28, 3, 4, 7, 9, 14])             # should return false
p valid_series?([20, 6, 9, 4, 2, 1, 2, 3])        # should return true
p valid_series?([10, 6, 19, 2, 6, 4])             # should return false

=begin
In the buggy original code, line 5 always returns true, because an assignment
operator is used instead of a comparison operator. The ternary operator is
executed first, and because 3 is always truthy, ture is always returned and
assigned to odd_count. odd_count is value is then returned because it is the
final statement of the method.
=end
