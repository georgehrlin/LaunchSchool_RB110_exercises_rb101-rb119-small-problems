=begin
Combining Arrays

Write a method that takes two Arrays as arguments, and returns an Array that
contains all of the values from the argument Arrays. There should be no
duplication of values in the returned Array, even if there are duplicates in
the original Arrays.

Example:
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]
=end

=begin
PEDAC
P
Input:
- Two arr
Output:
- An arr with the two input arr combined and repetitive elements removed

E
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

D
Input: Two arr
Output: An arr

A
- Combine two input arr
- Use uniq to get rid of repetitive elements
=end

def merge(arr1, arr2)
  (arr1 << arr2).flatten.uniq
  # arr1.concat(arr2).uniq
  # (arr1 + arr2).uniq
end

# OFFICIAL SOLUTION
def merge(arr1, arr2)
  arr1 | arr2
end
