=begin
Running Totals

Write a method that takes an Array of numbers, and returns an Array with the
same number of elements, and each element has the running total from the
original Array.

A running total is the sum of all values in a list up to and including the
current element. Thus, the running total when looking at index 2 of the array
[14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is
47 (14 + 11 + 7 + 15).
=end

=begin
PEDAC
P
Input:
- An array of integers
Output:
- An array of integers, which are the running totals from the input array
- A running total is the sum of all values in a list up to and including the
  current element

E
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

D
- Input: An array of integers
- Intermediary: Integers
- Output: An array of integers

A
General
- Iterate over input array
  - Accumulate sum by adding current integer to it
  - Append such sum to new array
- Return new array
=end
=begin
def running_total(nums)
  result = []
  total = 0
  nums.each { |num| result << (total += num) }
  result
end
=end
=begin
def running_total(nums)
  total = 0
  nums.map { |num| total += num }
end
=end

=begin
FURTHER EXPLORATION

Try solving this problem using Enumerable#each_with_object or Enumerable#reduce
(note that Enumerable methods can be applied to Arrays).
=end
=begin
def running_total(nums)
  total = 0
  nums.each_with_object([]) { |num, result| result << total += num }
end
=end

def running_total(nums)
  nums.inject([]) do |memo, num|
    if memo.empty?
      memo << num
    else
      memo << memo.last + num
    end
  end
end

# By Kiran K Madan
def running_total(nums)
  nums.inject([]) { |memo, num| memo << (memo.last.to_i + num)}
end

p running_total([2, 5, 13]) #== [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) #== [14, 25, 32, 47, 67]
p running_total([3]) #== [3]
p running_total([]) #== []
