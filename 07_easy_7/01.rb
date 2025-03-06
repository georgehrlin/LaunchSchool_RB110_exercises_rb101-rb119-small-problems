=begin
Combine Two Lists

Write a method that combines two Arrays passed in as arguments, and returns a
new Array that contains all elements from both Array arguments, with the
elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the
same number of elements.

Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
=end

=begin
PEDC
P
Input:
- Two arr
Output:
- An arr that is the combination of both input arr, but with the elements in an
  alternating order
Explicit:
- Both input arr are non-empty and contain the same number of elements

E
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

D
Input: Two arr
Output: An arr

A
- Initialize an empty result arr to collect results
- Iterative over first input arr with index
 - Append element to result arr
 - Append element in second input arr at same index to result arr
- Return result arr
=end
=begin
def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |e, i|
    result << e
    result << arr2[i]
  end

  result
end
=end
=begin
def interleave(arr1, arr2)
  arr1.map.with_index do |el, i|
    [el, arr2[i]]
  end
  .flatten
end
=end
=begin
FURTHER EXPLORATION

Take a few minutes to read about Array#zip. #zip doesn't do the same thing as
interleave, but it is very close, and more flexible. In fact, interleave can be
implemented in terms of zip and one other method from the Array class. See if
you can rewrite interleave to use zip.
=end
=begin
# Using flatten
def interleave(arr1, arr2)
  arr1.zip(arr2).flatten(1)
  # Specify 1 level of flatten to preserve nested arrays as original elements
end
=end
=begin
def interleave(arr1, arr2)
  result = []
  arr1.zip(arr2).each { |subarr| subarr.each { |e| result << e } }

  result 
end
=end
def interleave(arr1, arr2)
  result = []
  arr1.zip(arr2) { |subarr| subarr.each { |e| result << e } }
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']
p interleave([[0, 1], 3], [2, [4, 5]])
