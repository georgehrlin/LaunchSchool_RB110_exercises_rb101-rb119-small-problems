=begin
Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements
of the original list in reverse order. Do not modify the original list.

You may not use Array#reverse or Array#reverse!, nor may you use the method you
wrote in the previous exercise.

Examples:
p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse(['abc']) == ['abc']                   # => true
p reverse([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true
=end

=begin
PEDAC
P
Input:
- An arr
Output:
- An arr with reversed order of elements

E
p reverse([1, 2, 3, 4]) == [4, 3, 2, 1]         # => true
p reverse([1, 2, 3, 4, 1]) == [1, 4, 3, 2, 1]   # => true
p reverse(%w(a b e d c)) == %w(c d e b a)       # => true
p reverse(['abc']) == ['abc']                   # => true
p reverse([]) == []                             # => true

list = [1, 3, 2]                                # => [1, 3, 2]
new_list = reverse(list)                        # => [2, 3, 1]
p list.object_id != new_list.object_id          # => true
p list == [1, 3, 2]                             # => true
p new_list == [2, 3, 1]                         # => true

D
Input: An arr
Output: An arr

A
- Initialize an empty arr to keep track of result
- Iterate over input array from last element to first
  - Append each element to result arr
- Return result arr
=end
=begin
def reverse(arr)
  result = []
  idx = arr.size - 1
  until idx < 0
    result << arr[idx]
    idx -= 1
  end

  result
end
=end
=begin
# After method-hunting
def reverse(arr)
  result = []
  arr.reverse_each { |element| result << element }
  result
end
# Note: reverse_each only applies to arrays
=end
=begin
An even shorter solution is possible by using either #reduce or
#each_with_object. Just for fun, read about these methods in the Enumerable
module documentation, and try using one in your #reverse method.
=end
=begin
def reverse(arr)
  arr.each_with_object([]) { |element, result| result.prepend(element) }
end
=end

def reverse(arr)
  arr.reduce([]) { |sum, element| sum.prepend(element) }
end
