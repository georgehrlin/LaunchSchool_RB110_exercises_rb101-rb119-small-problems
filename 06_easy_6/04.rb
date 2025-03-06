=begin
Reversed Arrays (Part 1)

Write a method that takes an Array as an argument, and reverses its elements in
place; that is, mutate the Array passed into this method. The return value
should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the
array. The array only has one element, a String, but we're not reversing the
String itself, so the reverse! method call should return ['abc'].

Examples:
list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = [1, 2, 3, 4, 1]
result = reverse!(list)
p result == [1, 4, 3, 2, 1] # true
p list == [1, 4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true
=end

=begin
PEDAC
P
Input:
- An array
Output:
- Input array mutated with the order of elements reversed

E
list = [1, 2, 3, 4]
result = reverse!(list)
p result == [4, 3, 2, 1] # true
p list == [4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = [1, 2, 3, 4, 1]
result = reverse!(list)
p result == [1, 4, 3, 2, 1] # true
p list == [1, 4, 3, 2, 1] # true
p list.object_id == result.object_id # true

list = %w(a b e d c)
p reverse!(list) == ["c", "d", "e", "b", "a"] # true
p list == ["c", "d", "e", "b", "a"] # true

list = ['abc']
p reverse!(list) == ["abc"] # true
p list == ["abc"] # true

list = []
p reverse!(list) == [] # true
p list == [] # true

D
Input: An arr
Output: An arr

A
Input arr:
%w[a b c d]

d a b c d
d a b c

d c a b c
d c a b

d c b a b
d c b a

d c b a a
d c b a

3 -> 0
2 -> 1
1 -> 2
0 -> 3

- Initialize an var that keeps track of the index at which to insert the
  current last element
- UNTILL insertion_idx is >= length of input arr - 1
  - Insert current last element at insertion_idx
  - Remove the last element
  - Increment insertion_idx by 1
=end

def reverse!(arr)
  insertion_idx = 0
  until insertion_idx >= arr.length - 1
    arr.insert(insertion_idx, arr.last)
    arr.pop
    insertion_idx += 1
  end

  arr
end

# OFFICIAL SOLUTION
def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end
