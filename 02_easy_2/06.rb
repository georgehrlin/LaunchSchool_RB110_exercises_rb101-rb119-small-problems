=begin
Odd Numbers
Print all odd numbers from 1 to 99, inclusive, to the console, with each number
on a separate line.
=end

=begin
PEDAC
P
Input:
- Integers from 1 to 99
Output:
- Output of all odd numbers from 1 to 99 (inclusive) with each on a separate
  line

E
odd_nums(1..99)
# Output:
# 1
# 3
# 5
# ...
# 97
# 99

D
Input: A range object
Intermediate: Potentially array and integer
Output: Output of integers on separate lines

A
- Iterate over a collection of integers from 1 to 99, inclusive
- Determine whether each integer being iterated is odd
  - Output integer if it is odd
=end

def odd_nums(nums = 1..99)
  nums.each { |num| puts num if num.odd? }
end

# odd_nums

=begin
FURTHER EXPLORATION
Repeat this exercise with a technique different from the one you just used, and
different from the solution shown above. You may want to explore the use
Integer#upto or Array#select methods, or maybe use Integer#odd?
=end

# (1..99).select { |num| num.odd? }.each { |num| puts num }
# (1..99).select(&:odd?).each { |num| puts num }
