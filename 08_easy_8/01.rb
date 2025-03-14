=begin
Sum of Sums

Write a method that takes an Array of numbers and then returns the sum of the 
sums of each leading subsequence for that Array.

You may assume that the Array always contains at least one number.

Examples:
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35
=end

=begin
PEDAC
P
Input:
- An arr of ints
Output:
- An int that is the sum of the sums of each leading subsequence in input arr
- Can be assumed that input arr contains at least one int

E
sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

D
Input: An arr of ints
Output: An int

A
- Initialize an empty arr to collect sums
- Iterate over input arr using times and the size of arr
  - Append the sum of the subarr from index 0 to index (iterator number)
- Return the sum of sums arr
=end

def sum_of_sums(nums)
  sum = 0
  nums.size.times { |n| sum += nums[0..n].sum }
  sum
end

p sum_of_sums([3, 5, 2]) #  == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) #  == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) #  == 4
p sum_of_sums([1, 2, 3, 4, 5]) #  == 35

# OFFICIAL SOLUTION
def sum_of_sums(nums)
  sum_total
  1.upto(nums.size) do |count|
    sum_total += nums[0, count].reduce(:+)
  end
  sum_total
end
