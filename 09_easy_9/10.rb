=begin
Sum of Digits

Write a method that takes one argument, a positive integer, and returns the sum
of its digits.

Examples:
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
=end

=begin
PEDAC
P
Input:
- An int
Output:
- An int that is the sum of all the individual digits of input int

E
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

D
Input: An int
Output: An int

A
- Convert input int into a str
- Split str into an arr of digit strs
- Convert digit strs into ints
- Sum up digit ints
=end

=begin
def sum_of_digits(num)
  num.to_s.chars.reduce { |s, n| s.to_i + n.to_i }
end
=end

=begin
def sum_of_digits(num)
  num.to_s.chars.reduce { |s, n| s.to_i + n.to_i }
end
=end

# For a challenge, try writing this without any basic looping constructs
# (while, until, loop, and each).

=begin
496 / 100 => 4
96  / 10  => 9
6   / 1   => 6

496.divmod(100) => [4, 96] 10^2
96.divmod(10)   => [9, 6]  10^1
6.divmod(1)     => [6, 0]  10^0

- 496.to_s.size.times do |n|
  - digit, next_num = 496.divmod(10^496.to_s.size - 1)
  - digit, next_num = 96.divmod(10^496.to_s.size - 2)
  - digit, next_num = 6.divmod(10^496.to_s.size - 3)
=end

def sum_of_digits(num)
  digits = []
  num_digits = num.to_s.size
  num_digits.times do |n|
    digit, num = num.divmod(10**(num_digits - (n + 1)))
    digits << digit
  end
  digits.sum
end

# OFFICIAL SOLUTIONS
def sum_of_digits(num)
  sum = 0
  str_digits = num.to_s.chars

  str_digits.each do |str_digit|
    sum += str_digit.to_i
  end

  sum
end

def sum_of_digits(num)
  num.to_s.chars.map(&:to_i).reduce(:+)
end

# By AJ Clarke
def sum_of_digits(num)
  num.digits.sum
end
