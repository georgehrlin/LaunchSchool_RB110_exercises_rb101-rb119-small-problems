=begin
Find the Duplicate

Given an unordered array and the information that exactly one value in the
array occurs twice (every other value occurs exactly once), how would you
determine which value occurs twice? Write a method that will find and return
the duplicate value that is known to be in the array.

Examples:
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73
=end

=begin
PEDAC
P
Input:
- An arr of unordered integers
  - Every integer is unique except one that has a duplicate
Output:
- An integer that is the duplicate integer

E
find_dup([1, 5, 3, 1]) == 1
find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58]) == 73

D
Input: An arr
Output: An int

A
(This algorithm below does not work because #- or #difference gets rid of ALL
elements within the caller that are the same as the elements in the argument
array, not just the first occurence of the element)
- Because I know uniq
  - Calling uniq on input arr returns an arr with all unique integers
  - "Subtracting" input arr with the returned arr of uniq returns an arr with
    the only duplicate integer
  - Return the only integer within that arr

(I was reminded of the existence of #count when reading on how #- and
#difference work. I can just use it with #select.)
=end
=begin
def find_dup(arr)
  arr.select { |ele| arr.count(ele) == 2 }.last
end
=end
=begin
# OFFICIAL SOLUTION
def find_dup(arr)
  arr.find { |ele| arr.count(ele) == 2 }
end
=end
=begin
Further Exploration

There are several ways to go about solving this problem. One other way would be
to have a separate array that keeps track of which items have been looked at as
we iterate through the original array. If we ever add the same item twice to
this second array, then we know that we have found a duplicate.
=end

def find_dup(arr)
  checked = []
  arr.each do |ele|
    if checked.include?(ele)
      return ele
    else
      checked << ele
    end
  end
end

p find_dup([1, 5, 3, 1])
p find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
          38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
          14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
          78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
          89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
          41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
          55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
          85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
          40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
          7,  34, 57, 74, 45, 11, 88, 67,  5, 58])