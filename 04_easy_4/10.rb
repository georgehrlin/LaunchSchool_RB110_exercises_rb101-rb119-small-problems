=begin
Convert a Signed Number to a String!

In the previous exercise, you developed a method that converts non-negative
numbers to strings. In this exercise, you're going to extend that method by
adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string
representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. You may, however, use
integer_to_string from the previous exercise.
=end

=begin
PEDAC
P
Input:
- An integer that may be positive or negative (or zero)
Output:
- A string that is the string representation of the input integer

E
signed_integer_to_string(4321) == '+4321'
signed_integer_to_string(-123) == '-123'
signed_integer_to_string(0) == '0'

D
Input: An integer
Output: A string

A
- Find the absolute value of input intger
- Use integer_to_string to find string representation
- If input integer is larger than 0, prepend '+' to result string
  - If negative, prepend '-'
=end

DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def integer_to_string(int)
  result = ''
  loop do
    int, remainder = int.divmod(10)
    result.prepend(DIGITS[remainder])
    break if int == 0
  end
  result
end

p integer_to_string(4321)
p integer_to_string(777)
p integer_to_string(0)

def signed_integer_to_string(int)
  result = integer_to_string(int.abs)
  result.prepend(if int > 0
    '+'
  elsif int < 0
    '-'
  else
    ''
  end)
end

p signed_integer_to_string(4321) # == '+4321'
p signed_integer_to_string(-123) # == '-123'
p signed_integer_to_string(0) # == '0'
