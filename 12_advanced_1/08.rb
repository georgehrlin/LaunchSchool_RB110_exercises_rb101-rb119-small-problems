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
