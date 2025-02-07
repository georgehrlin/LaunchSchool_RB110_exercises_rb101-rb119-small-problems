=begin
Even Numbers
Print all even numbers from 1 to 99, inclusive, to the console, with each
number on a separate line.
=end

=begin
PEDAC
P
Input:
- (Not entirely sure because input depends on solution)
- Integers from 1 to 99
Output:
- Output of all even numbers from 1 to 99 (inclusive) with each on its own
  separate line

E
even_nums(1..99)
# Output:
# 2
# 4
# 6
# ...
# 98

D
Input: A range of integers, or just integers (depending on solution)
Output: Output of individual integers

A
- Iterate over a collection of numbers from 1 to 99, inclusive
  - If number is even, output it
=end
=begin
def even_nums(nums = 1..99)
  nums.each { |num| puts num if num.even? }
end

even_nums
=end

# (1..99).select(&:even?).each { |even_num| puts even_num }

1.upto(99) { |num| puts num if num.even? }
