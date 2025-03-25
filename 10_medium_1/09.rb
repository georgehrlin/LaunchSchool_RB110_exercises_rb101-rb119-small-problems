=begin
Fibonacci Numbers (Procedural)

Rewrite your recursive fibonacci method so that it computes its results without
recursion.
=end

=begin
PEDAC
P
Input:
- An int that is the n in the n-th Fibonacci number
Output:
- An int that is the n-th Fibonacci number

E
fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

D
Input: An int
Output: An int

A
- Generate an arr of ints that contains input-int number of ints
  - Initialize a var, sequence, that points to [1, 1] as the starting sequence
  - For (input-int - 2) number times
    - Push sum of the last two ints in sequence to sequence
- Return last int of arr
=end

def fibonacci(nth)
  sequence = [1, 1]
  (nth - 2).times { sequence.push(sequence[-1] + sequence[-2]) }
  sequence[-1]
end

# OFFICIAL SOLUTION
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) { first, last = [first, first + last] }
  last
end

=begin
(nth - 2)
3.upto(nth)
(3..nth)
=end

# By Kevin Moore
def fibonacci(nth)
  last = 0
  last_minus_two = 1
  nth.times do
    last = last_minus_two + last
    last_minus_two = last - last_minus_two
  end
  last
end

# By Nick Johnson
def fibonacci(nth)
  (3..nth).reduce([1, 1]) { |(a, b), _| [b, a + b]}.last
end
