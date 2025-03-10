=begin
Multiply Lists

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of each pair
of numbers from the arguments that have the same index. You may assume that the
arguments contain the same number of elements.

Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
=end

=begin
PEDAC
P
Input:
- Two arrs of ints
Output:
- A new arr of ints which are the products of ints at each same index from the
  two input arrs

E
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

D
Input: Two arrs of ints
Output: An arr of ints

A
- With map, iterate over first input arr with index
  - In each iteration, return product of int and int at index in second arr
=end
=begin
def multiply_list(arr1, arr2)
  arr1.map.with_index { |int, idx| int * arr2[idx] }
end
=end
# OFFICIAL SOLUTION
=begin
def multiply_list(arr1, arr2)
  products = []
  arr1.each_with_index do |item, index|
    products << item * arr2[index]
  end
  products
end
=end
# FURTHER EXPLORATION

# The Array#zip method can be used to produce an extremely compact solution to
# this method. Read the documentation for zip, and see if you can come up with
# a one line solution (not counting the def and end lines).
=begin
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |pair| pair.reduce(:*) }
end
=end

# By Sush Krishnamoorthy
def multiply_list(arr1, arr2)
  arr1.zip(arr2).map { |(a, b)| a * b }
end

p multiply_list([3, 5, 7], [9, 10, 11])# == [27, 50, 77]
