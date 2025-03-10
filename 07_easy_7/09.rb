=begin
Multiply All Pairs

Write a method that takes two Array arguments in which each Array contains a
list of numbers, and returns a new Array that contains the product of every
pair of numbers that can be formed between the elements of the two Arrays. The
results should be sorted by increasing value.

You may assume that neither argument is an empty Array.

Example:
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]
=end

=begin
PEDAC
P
Input:
- Two arrs of ints. Can have different numbers of ints
Output:
- A new arr of ints which are all the possible products of ints in two input
  arrs
- In increasing order
Explicit:
- Can assume none of input arrs are empty

E
multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]

D
Input: Two arrs of ints
Output: An arr of ints

A
- Iterate over first input arr
  - Iterate over second input arr
  - Append product of eles being iterated in first arr and in second arr to a
    result arr
- Sort result arr in ascending order and return it
=end
=begin
def multiply_all_pairs(arr1, arr2)
  result = []
  arr1.each do |num1|
    arr2.each do |num2|
      result.push(num1 * num2)
    end
  end

  result.sort
end
=end

# Using map
def multiply_all_pairs(arr1, arr2)
  arr1.map do |num1|
    products = []
    arr2.each do |num2|
      products << num1 * num2
    end
    products
  end
  .flatten.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2])# == [2, 4, 4, 6, 8, 8, 12, 16]

# OFFICIAL SOLUTION
def multiply_all_pairs(arr1, arr2)
  arr1.product(arr2).map { |num1, num2| num1 * num2 }.sort
end
