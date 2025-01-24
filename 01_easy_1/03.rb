=begin
Stringy Strings
Write a method that takes one argument, a positive integer, and returns a
string of alternating 1s and 0s, always starting with 1. The length of the
string should match the given integer.

PEDAC
P
Input: A positive intger that decides the length of the output string
Output: A string consisting of 1s and 0s, starting with 1, whose length is
        determined by the niput integer

E
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

D
Input: A positive integer
Output: A string

A
- Initiate a variable result, an empty string
- Create a loop that iterates input integer times with Integer#times
  - If number passed to block is even, append 1 to result
  - Otherwise, append 0 to result
- Return result
=end

def stringy(len)
  result = ''

  len.times do |num|
    result << (num.even? ? '1' : '0')
  end

  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# OFFICIAL SOLUTION
def stringy(size)
  numbers = []

  size.times do |index|
    number = index.even? ? 1 : 0
    numbers << number
  end

  numbers.join
end

=begin
FURTHER EXPLORATION
Modify stringy so it takes an additional optional argument that defaults to 1.
If the method is called with this argument set to 0, the method should return a
String of alternating 0s and 1s, but starting with 0 instead of 1.

A
- Initiate a variable result, an empty string
- Create a loop that iterates input integer times with Integer#times
  - If start is 1 (default)
    - If number passed to block is even, append 1 to result
    - Otherwise, append 0 to result
  - If start is 0
    - If number passed to block is even, append 0 to result
    - Otherwise, append 1 to result
- Return result
=end

=begin
def stringy(len, start = 1)
  result = ''

  case start
  when 1
    len.times { |num| result << (num.even? ? '1' : '0') }
  when 0
    len.times { |num| result << (num.even? ? '0' : '1') }
  else
    return puts 'The starting digit must either be 0 or 1!'
  end

  result
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'

puts stringy(6, 1) == '101010'
puts stringy(9, 1) == '101010101'

puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'

puts stringy(6, 3) == '010101'
puts stringy(9, 5) == '010101010'
=end

# OTHER SOLUTIONS
def stringy(int)
  Array.new(int) { |i| i.even? ? '1' : '0' }.join
end

def stringy(int, digit_1st = 1)
  digit_2nd = digit_1st == 1 ? '0' : '1'
  Array.new(int) { |i| i.even? ? digit_1st.to_s : digit_2nd }.join
end
