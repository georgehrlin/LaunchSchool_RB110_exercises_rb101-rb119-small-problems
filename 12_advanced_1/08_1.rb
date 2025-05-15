=begin
Merge Sort

Sort an array of passed in values using merge sort. You can assume that this
array may contain only one type of data, and that data may be either all
numbers or all strings.
=end

=begin
PEDAC
P
Input:
- An arr that contains only one type of data (num or str)
Output:
- An arr that is the sorted input arr

E
merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
merge_sort([5, 3]) == [3, 5]
merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
merge_sort([9, 2, 7, 6, 8, 5, 0, 1]) == [0, 1, 2, 5, 6, 7, 8, 9]

merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]

D
Input: An arr
Output: Arr

A
(As shown in the question's explanation)
Deconstruction
- Convert original arr into an arr of two half arrs
- Keep converting, further dividing each subarr
- (Continue until each lowest level subarr only contains one ele)
Reconstruction (Merger)
- Starting at the second-lowest level, merge each two lowest-level subarrs into
  a sorted subarr of two eles
- (Continue merging and sorting lowest level subarrs until only one level)

Subproblem: Converting original arr into an arr of nested halved subarrs down
to the individual ele
[9, 2, 7, 6, 8, 5, 0, 1] ->
[[[[9], [2]], [[7], [6]]], [[[8], [5]], [[0], [1]]]]
- Initialize an empty result arr
- 
- Loop:
  - Find idx of the first ele of the second would-be subarr (mid-point)
    - BREAK if mid-point idx is 0
    - Append an arr of eles from indicies 0 to mid-point idx
    - Append an arr of eles from indicies mid-point to last idx
=end

=begin
def halve_an_arr(arr)
  # For arrays with an odd num of elements, the first subarr will contain an
  # odd number of elements
  result = []
  if arr.size > 1
    idx_midpoint = arr.size / 2
    result << arr[0...idx_midpoint]
    result << arr[idx_midpoint..-1]
  else
    result << [arr.first]
  end

  result
end

def halve_subarrs!(arr_subarrs)
  # For a nested arr of subarrs, this halves all the subarrs into one level
  # lower half subarrs
  arr_subarrs.each_with_index do |subarr, idx|
    arr_subarrs[idx] = halve_an_arr(subarr)
  end
end

def deconstruction(arr)
  result = []
  result = halve_an_arr(arr)

  result.each_with_index do |subarr, idx|
    result[idx] = halve_an_arr(subarr)
    puts "result is #{result}" # [[[9, 2], [7, 6]], [8, 5, 0, 1]]
    puts "subarr is #{subarr}" # [9, 2, 7, 6]
    subarr = halve_an_arr(subarr)[0]
    puts "subarr is #{subarr}" # [9, 2]
    until subarr.size == 1
      halve_subarrs!(subarr)
      subarr = subarr[0]
    end
  end

  result
end


# p halve_an_arr([1]) # => [1]
# p halve_an_arr([9, 2, 7, 6, 8, 5, 0, 1])
# p halve_an_arr([9, 2, 7, 6, 8, 5, 0])

p deconstruction([9, 2, 7, 6, 8, 5, 0, 1])

#p deconstruction([9, 2, 7, 6, 8, 5, 0])
=end

=begin
Subproblem: Deconstruct an array by continuously halving its elements into half
subarrays until the lowest level subarrays only contain the individual elements

Examples:
deconstruct([1, 2, 3, 4, 5, 6, 7, 8])
# => [[[[1], [2]], [[3], [4]]], [[[5], [6]], [[7], [8]]]]
deconstruct([1, 2, 3])
# => ([[1], [2]], [[3]])
deconstruct([1])
# => [[1]]
deconstruct([])
# => []
=end

=begin
PEDAC
P
Input:
- An arr of elements
Output:
- A multi-level nested arrays
  - Each level contains half of the elements from previous level
  - Lowest level is single-element arrays

D
Input: An arr
Output: A multi-level nested arrays

A
Example
[1, 2, 3, 4]
[[1, 2], [3, 4]]
[[[1], [2]], [[3], [4]]]

General
- First half: elements of indices from 0 to array.size / 2 (exclusive)
- Second half: elements of indices from array.size / 2 to -1
=end

=begin
a = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]

def make_halves(arr)
  result = []

  length = arr.length
  idx_midpoint = length / 2
  subarr_first = arr[0...idx_midpoint]
  subarr_second = arr[idx_midpoint..-1]

  result << subarr_first
  result << subarr_second
end

p make_halves(a)
# => [[1, 2, 3, 4], [5, 6, 7, 8]]

p make_halves(a).map { |subarr| make_halves(subarr) }
# => [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]

p (make_halves(a).map do |subarr|
     make_halves(subarr).map do |subsubarr|
     make_halves(subsubarr)
   end
end)

p (make_halves(a).map do |subarr|
     make_halves(subarr).map do |subsubarr|
       make_halves(subsubarr).map do |subsubsubarr|
         make_halves(subsubsubarr)
     end
   end
end)

# p [make_halves(make_halves(a)[0]), make_halves(make_halves(a)[1])]
# => [[[1, 2], [3, 4]], [[5, 6], [7, 8]]]
=end

=begin
# Using recursion after studying the Official Solution for 08
def divide(arr)
  result = []
  return arr if arr.size == 1

  half_first = arr[0...arr.size / 2]
  half_second = arr[arr.size / 2..-1]

  result << divide(half_first)
  result << divide(half_second)
end
=end

# Without using recursion (ChatGPT's solution)
def divide(arr)
  result = []
  stack = [arr]

  until stack.empty?
    current = stack.pop

    if current.size == 1
      result << current 
    else
      half_first = current[0...current.size / 2]
      half_second = current[current.size / 2..-1]

      stack << half_first
      stack << half_second
    end
  end

  result
end

a = [1, 2, 3, 4, 5, 6, 7, 8]

p divide(a)
