=begin
Does My List Include This?

Write a method named include? that takes an Array and a search value as
arguments. This method should return true if the search value is in the array,
false if it is not. You may not use the Array#include? method in your solution.

Examples:
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false
=end

=begin
PEDAC
P
Input:
- An arr and an object that is a search value
Output:
- A bol of whether the search value is in the input arr

E
include?([1,2,3,4,5], 3) == true
include?([1,2,3,4,5], 6) == false
include?([], 3) == false
include?([nil], nil) == true
include?([], nil) == false

D
Input: An arr and an undefeind object
Output: A bol

A
- Iterate over input arr
  - IF element is the same as search value
    - RETURN true
    - BREAK loop
- RETURN false
=end
=begin
def include?(arr, search_val)
  result = false
  arr.each do |ele|
    result = true if ele == search_val
  end

  result
end

# OFFICIAL SOLUTION
def include?(array, value)
  !!array.find_index(value)
end

def include?(arr, search_val)
  arr.each { |ele| return true if ele == search_val}
  false
end
=end

# FURTHER EXPLORATION
# Can you think of other solutions to this problem?
def include?(arr, val)
  !(arr.select { |ele| ele == val }.empty?)
end

# SOLUTIONS BY SCHOOLMATES
def include?(arr, val)
  arr.any?(val)
end

def include?(arr, val)
  arr.count(val) > 0
end

def include?(arr, val)
  arr << val
  return true if arr.uniq! != nil
  false
end
