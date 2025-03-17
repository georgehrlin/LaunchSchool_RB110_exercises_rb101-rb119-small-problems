=begin
Counting Up

Write a method that takes an integer argument, and returns an Array of all
integers, in sequence, between 1 and the argument.

You may assume that the argument will always be a valid integer that is greater
than 0.

Examples:
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]
=end

=begin
PEDAC
P
Input:
- An int
Output:
- An arr of ints that are all the ints from 1 to input int
Explicit:
- Argument will always be a valid int greater than 0

E
sequence(5) == [1, 2, 3, 4, 5]
sequence(3) == [1, 2, 3]
sequence(1) == [1]

D
Input: An int
Outpu: An arr of ints

A
- Initialize a range object based on input int and convert it

OR
- Use upto
=end

=begin
def sequence(num)
  (1..num).to_a
end
=end

=begin
def sequence(num)
  result = []
  1.upto(num) { |n| result << n }
  result
end
=end

=begin
FURTHER EXPLORATION

Food for thought: what do you think sequence should return if the argument is
not greater than 0. For instance, what should you do if the argument is -1?
Can you alter your method to handle this case?
=end

def sequence(num)
  num > 1 ? (1..num).to_a : (num..1).to_a
end

p sequence(5)
p sequence(-5)
p sequence(0)

# By Lewis Isom
def sequence(num)
  num.positive? ? [*1..num] : [*num..1]
end
