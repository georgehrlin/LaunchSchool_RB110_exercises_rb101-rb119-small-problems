=begin
Sequence Count

Create a method that takes two integers as arguments. The first argument is a
count, and the second is the first number of a sequence that your method will
create. The method should return an Array that contains the same number of
elements as the count argument, while the values of each element will be
multiples of the starting number.

You may assume that the count argument will always have a value of 0 or
greater, while the starting number can be any integer value. If the count is 0,
an empty list should be returned.

Examples:
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []
=end

=begin
PEDAC
P
Input:
- An int that represents the num of ele in output arr
- An int that represents the starting int of ints in output arr
Output:
- An arr of ints
  - Num of ints is first input int
  - Ints are increasing multiples of second input int

E
sequence(5, 1) == [1, 2, 3, 4, 5]
sequence(4, -7) == [-7, -14, -21, -28]
sequence(3, 0) == [0, 0, 0]
sequence(0, 1000000) == []

D
Input: Two ints
Output: An arr of ints

A
- Intialize an empty result arr
- Use a range object or upto for iterations of a specific number
  - Append second input int multiplied by num iterated to result arr
- Return result arr
=end

def sequence(arr_size, int_start)
  1.upto(arr_size).with_object([]) { |n, result| result << int_start * n }
end

p sequence(5, 1) # == [1, 2, 3, 4, 5]
p sequence(4, -7) # == [-7, -14, -21, -28]
p sequence(3, 0) # == [0, 0, 0]
p sequence(0, 1000000) # == []

# OFFICIAL SOLUTION
def sequence(count ,first)
  (1..count).map { |n| first * n }
end

# By Adam Dresher
def sequence(count, first)
  (1..count).reduce([]) { |result, n| first * n }
end
