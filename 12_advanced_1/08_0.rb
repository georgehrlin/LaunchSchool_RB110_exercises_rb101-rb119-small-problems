=begin
I did not end up coming up with a solution for this question. I was hard stuck
at the first sub-problem for a few days: I did not know how to make the method
continuously break itself in the middle until each subarray the lowest level
only contains one element.

08_1.rb contains all of my effort in trying to solve the problem myself.
=end

def sorted_insert(n, arr)
  if !arr.empty?
    (arr.size - 1).downto(0) do |idx|
      if n > arr[idx]
        arr.insert(idx + 1, n)
        break
      elsif idx == 0
        arr.unshift(n)
      end
    end
  else
    arr << n
  end

  arr
end

def merge(arr1, arr2)
  arr_result = []
  length_arr_large = [arr1.size, arr2.size].max

  (0...length_arr_large).each do |idx|
    sorted_insert(arr1[idx], arr_result) if arr1[idx] != nil
    sorted_insert(arr2[idx], arr_result) if arr2[idx] != nil
  end

  arr_result
end

# OFFICIAL SOLUTION
def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

arr = [9, 2, 7, 6, 8, 5, 0, 1]

p merge_sort(arr)
