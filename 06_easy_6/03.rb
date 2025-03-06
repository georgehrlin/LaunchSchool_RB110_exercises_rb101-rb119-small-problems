=begin
Fibonacci Number Location By Length

The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
such that the first 2 numbers are 1 by definition, and each subsequent number
is the sum of the two previous numbers. This series appears throughout the
natural world.

Computationally, the Fibonacci series is a very simple series, but the results
grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
354,224,848,179,261,915,075 -- that's enormous, especially considering that it
takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci
number that has the number of digits specified as an argument. (The first
Fibonacci number has index 1.)

You may assume that the argument is always greater than or equal to 2.

Examples:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847
=end

=begin
PEDAC
P
Input:
- An integer that indicates the number of digits of a Fibonacci number
Output:
- An integer that represents the index of the first occurence of the Fibonacci
  number that contains the number of digits specified by the input integer
Explicit:
- Unlike the index of an array, the first Fibonacci number has an index of 1
- Argument is always greater than or equal to 2

E
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

D
Input: An int
Output: An int

A
- Initialize an arr of Fi numbers with the first two numbers being 1
- Continue to generate the next Fi number
  - Check the number of digits of this most recently generated number
  - IF it has the same number of digits as the input int
    - Return its index in the arr + 1

Subproblem: Return an int's number of digits
- I can use Integer#digits
- Integer#digits returns an array of individual digits starting from the one's
  place
- I can call Array#size on the return value
=end
=begin
def find_fibonacci_index_by_length(num_digits)
  arr_fibonacci = [1, 1]
  until arr_fibonacci.last.digits.size == num_digits
    arr_fibonacci << arr_fibonacci[-1] + arr_fibonacci[-2]
  end
  arr_fibonacci.size
end

p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
=end
# This approach works execept for the last test case. The execution seems to be
# stuck in an infinite loop, but I suspect the size of the array of Fi numbers
# is probably becoming too large for Ruby to handle.

# From RJ Ponder
require 'benchmark'

# A different aporach by me:
def find_fibonacci_index_by_length_me(num_digits)
  first = 1
  second = 1
  idx_fi = 2
  next_fi = first + second

  until next_fi.digits.size >= num_digits
    next_fi = first + second
    idx_fi += 1

    first = second
    second = next_fi
  end

  idx_fi
end

puts Benchmark.measure { find_fibonacci_index_by_length_me(2000) }
