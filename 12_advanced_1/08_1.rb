=begin
Subproblem: Deconstruct an array by continuously halving its elements into half
subarrays until the lowest level subarrays only contain the individual elements

Examples:
deconstruct([1, 2, 3, 4, 5, 6, 7, 8])
# => [[[[1], [2]], [[3], [4]]], [[[5], [6]], [[7], [8]]]]
deconstruct([1, 2, 3])
# => ([[1], [2]], [[3]])
deconstruct([1])
# => [[1]]
deconstruct([])
# => []
=end

=begin
PEDAC
P
Input:
- An arr of elements
Output:
- A multi-level nested arrays
  - Each level contains half of the elements from previous level
  - Lowest level is single-element arrays

D
Input: An arr
Output: A multi-level nested arrays

A
Example
[1, 2, 3, 4]
[[1, 2], [3, 4]]
[[[1], [2]], [[3], [4]]]

General
- First half: elements of indices from 0 to array.size / 2 (exclusive)
- Second half: elements of indices from array.size / 2 to -1
=end

require 'pry'

def deconstruct(arr)
  midpoint = arr.size / 2
  first_half = arr[0...midpoint]
  second_half = arr[midpoint..-1]
  binding.pry
  result = [[first_half], [second_half]]

  until first_half.size == 1
    deconstruct(first_half)
    deconstruct(second_half)
  end

  result
end

p deconstruct([1, 2, 3, 4, 5, 6, 7, 8])


def mergesort(arr)
  midpoint = arr.size / 2
  until midpoint == 1
    first_half = arr[0...midpoint]
    second_half = arr[midpoint..-1]
    first_half = mergesort(first_half)
    second_half = mergesort(second_half)
    
  end
end