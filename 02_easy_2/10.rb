=begin
Always Return Negative

Write a method that takes a number as an argument. If the argument is a
positive number, return the negative of that number. If the number is 0 or
negative, return the original number.

Examples:
# All test cases should return true
puts negative(5) == -5
puts negative(-3) == -3
puts negative(0) == 0 # There's no such thing as -0 in Ruby
=end

=begin
PEDAC
P
Input:
- An integer
Output:
- The negative version of the input integer if the input integer is positive;
  otherwise the same integer as the input

E
p negative(5)  # => -5
p negative(-3) # => -3
p negative(0)  # => 0

D
Input:
- An integer
Output:
- An integer

A
- IF input integer is positive
  - Return negative version
- ELSE
  - Return same input integer
=end

def negative(num)
  num > 0 ? -num : num
end

p negative(5)  # => -5
p negative(-3) # => -3
p negative(0)  # => 0

# FURTHER EXPLORATION
# A: The alternative approach is smarter but not necessarily better as it is
# less readable.
