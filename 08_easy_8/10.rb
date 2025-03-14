=begin
Array Average

Write a method that takes one argument, an array containing integers, and
returns the average of all numbers in the array. The array will never be empty
and the numbers will always be positive integers. Your result should also be an
integer.

Don't use the Array#sum method for your solution - see if you can solve this
problem using iteration more directly.

Examples:
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40
=end

=begin
PEDAC
P
Input:
- An arr of ints
Output:
- An int that is the mean of all the vals in input arr

E
puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

D
Input: An arr of ints
Output: An int

A
- Find the sum of input arr and divide by the size
=end

=begin
def average(nums)
  nums.reduce(:+) / nums.size
end
=end

def average(nums)
  sum = 0
  nums.each { |num| sum += num }
  sum / nums.size
end

puts average([1, 6]) == 3 # integer division: (1 + 6) / 2 -> 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

=begin
FURTHER EXPLORATION

Currently, the return value of average is an Integer. When dividing numbers,
sometimes the quotient isn't a whole number, therefore, it might make more
sense to return a Float. Can you change the return value of average from an
Integer to a Float?
=end

def average(nums)
  nums.reduce(:+) / nums.size.to_f
end
