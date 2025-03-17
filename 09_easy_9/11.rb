=begin
Odd Lists

Write a method that returns an Array that contains every other element of an
Array that is passed in as an argument. The values in the returned list should
be those values that are in the 1st, 3rd, 5th, and so on elements of the
argument Array.

Examples:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]
=end

=begin
PEDAC
P
Input:
- An arr of ints
Output:
- An arr of ints at odd indicies

E
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []
oddities([1, 2, 3, 4, 1]) == [1, 3, 1]

D
Input: An arr of ints
Output: An arr of ints

A
- Initialize an empty result arr
- Iterate over input arr with index
  - IF index is even
    - Append int to result arr
- Return result arr
=end

=begin
def oddities(nums)
  nums.filter.with_index { |num, idx| idx.even? }
end
=end

# OFFICIAL SOLUTION
=begin
def oddities(array)
  odd_elements = []
  index = 0
  while index < array.size
    odd_elements << array[index]
    index += 2
  end
  odd_elements
end
=end

# FURTHER EXPLORATION
# Write a companion method that returns the 2nd, 4th, 6th, and so on elements
# of an array.

def evens(nums)
  nums.filter.with_index { |_, idx| idx.odd? }
end

# Try to solve this exercise in at least 2 additional ways.
=begin
def oddities(nums)
  odds = []
  nums.each_with_index do |num, idx|
    odds << num if idx.even?
  end
  odds
end
=end

=begin
def oddities(nums)
  nums.each_with_object([]).with_index do |(num, result), idx|
    result << num if idx.even?
  end
end
=end

# By Mitch
=begin
def oddities(nums)
  nums.each_index.with_object do |idx, result|
    result << nums[idx] if idx.even?
  end
end
=end

def oddities(nums)
  nums.map.with_index { |n, idx| n if idx.even? } # => [n@0, nil, n@2, nil, etc.]
  .compact # => [n@0, n@2, n@4, n@6, etc.]
end

=begin
def oddities(nums)
  (0...nums.size).step(2).map { |idx| nums[idx] }
end
=end

=begin
def oddities(nums)
  0.step(nums.size - 1, 2).map { |idx| nums[idx] }
end
=end

p oddities([2, 3, 4, 5, 6]) # == [2, 4, 6]
p oddities([1, 2, 3, 4, 5, 6]) # == [1, 3, 5]
p oddities(['abc', 'def']) # == ['abc']
p oddities([123]) # == [123]
p oddities([]) # == []
p oddities([1, 2, 3, 4, 1]) # == [1, 3, 1]
