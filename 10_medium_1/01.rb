=begin
Rotation (Part 1)

Write a method that rotates an array by moving the first element to the end of
the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
=end

=begin
PEDAC
P
Input:
- An arr of any kinds of objects
Output:
- A new arr of the same objects but with the original first element in last

E
rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

D
Input: An arr
Output: An arr

A
- Duplicate input arr
- Append first element
- Remove first element
=end

def rotate_array(arr)
  result = arr.dup.append(arr.first)
  result.delete_at(0)
  result
end

# OFFICIAL SOLUTION
=begin
def rotate_array(arr)
  arr[1..-1] + [arr[0]]
end
=end

# FURTHER EXPLORATION

# Write a method that rotates a string instead of an array. Do the same thing
# for integers. You may use rotate_array from inside your new method.

def rotate_string(str)
  rotate_array(str.chars).join
end

def rotate_int(int)
  rotate_array(int.digits.reverse).join.to_i
end

# By Maya Novarini
def rotate_array(arr)
  first, *remainder = arr
  [*remainder, first]
end

# By Zach
def rotate_array(arr)
  result = arr.dup
  result << result.shift
end
