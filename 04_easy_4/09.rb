=begin
Convert a Number to a String!

In the previous two exercises, you developed methods that convert simple
numeric strings to signed Integers. In this exercise and the next, you're going
to reverse those methods.

Write a method that takes a positive integer or zero, and converts it to a
string representation.

You may not use any of the standard conversion methods available in Ruby, such
as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
old-fashioned way and construct the string by analyzing and manipulating the
number.
=end

=begin
PEDAC
P
Input:
- A string that represents an integer
Output:
- An integer that is the numeric value of the input string
Explicit:
- No use of any of the standard conversion methods

E
integer_to_string(4321) == '4321'
integer_to_string(0) == '0'
integer_to_string(5000) == '5000'

D
Input: A string
Intermediary: Perhaps an array
Output: An integer

A
Draft
4000 / 1000  # => 4
4000 / 10000 # => 0

4321 / 1000  # => 4
4321 / 10000 # => 0

4321 / 100 # => 43
4321 / 10  # => 432

                       4321 / 10000  # => 0
                       4321 / 1000   # => 4 # 1000 is inital divisor
4321 - 4000 # => 321 | 321  / 100    # => 3
321  - 300  # => 21  | 21   / 10     # => 2
21   - 20   # => 1   | 1    / 1      # => 1

- Use a divisor that starts from 1 (or 10, not sure yet)
- Keep multiplying divisor by 10, and use it to divide input integer
- Until quotient of integer division is 0, decrease by a factor of 10
- To isolate each digit (until quotient is 0 because 1 / 10 # => 0)
  - Integer division with divisor, then quotient is digit
    - Use hash mapping to append corresponding string to result string
  - Then subtract input number with quotient times divisor
  - The difference is then to be integer-divided by divisor but divided by 10

General
- Need to somehow isolate each digit and convert each to a string, then combine
  them
=end

DIGIT_TO_STR = {
  0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4',
  5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'
}

def initial_divisor(int)
  divisor = 1
  until int / divisor == 0
    divisor *= 10
  end
  divisor /= 10
  divisor == 0 ? 1 : divisor
end

# p initial_divisor(4321)
# p initial_divisor(4000)
# p initial_divisor(11)
# p initial_divisor(10)
# p initial_divisor(1)
# p initial_divisor(0)

def integer_to_string(int)
  result = ''
  divisor = initial_divisor(int)
  until divisor == 0
    current_digit = int / divisor
    result << DIGIT_TO_STR[current_digit]
    int -= current_digit * divisor
    divisor /= 10
  end
  result
end

p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
p integer_to_string(8) == '8'
p integer_to_string(999) == '999'
p integer_to_string(909) == '909'
p integer_to_string(9009) == '9009'
