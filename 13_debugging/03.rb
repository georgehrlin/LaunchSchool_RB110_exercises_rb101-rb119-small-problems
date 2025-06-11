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

=begin
FURTHER EXPLORATION

If you take a close look at odd_count == 3 ? true : false, you see that the
equality comparison odd_count == 3 itself returns a Boolean. Is the ternary
operator on line 5 really necessary in order to return a Boolean from our
method?
=end

=begin
The ternary operator is unnecessary because the comparison operator already
returns a boolean value. There is no need to specify it using a ternary
operator.
=end

def valid_series?(nums)
  return false if nums.sum != 47

  odd_count = nums.count { |n| n.odd? }
  odd_count == 3 # No, the ternary operator on line 5 is not necessary
end

# By Bob Rodes
# Due to the possibility of such issue arising, some prefer to put the literal
# first (before the comparison operator) just in case:
3 == count ? true : false

# By Juliette Sinibardy
def valid_series?(nums)
  nums.count(&:odd?) == 3 && nums.sum == 47
end
