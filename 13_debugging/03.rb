=begin
Valid Series?
The valid_series? method checks whether a series of numbers is valid. For the
purposes of this exercise, a valid series of numbers must contain exactly three
odd numbers. Additionally, the numbers in the series must sum to 47.

Unfortunately, our last test case is not returning the expected result. Why is
that?
=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count = 3 ? true : false
end

=begin
Line 5 uses an assignment operator (=) instead of an equality comparison
operator (==). Because of this error, the condition is always evaluated by the
ternary operator to be true, which leads to line 5 always returning true.

CORRECTION

In the original faulty code, 3 is first evaluted by the ternary operator, which
leads to true being returned. Therefore, odd_count is assigned true on line 5,
not that odd_count is assigned 3 first and then evluated by the ternary
operator.
=end

# Fix
def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 ? true : false
end
