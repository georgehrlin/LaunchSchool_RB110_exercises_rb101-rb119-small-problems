=begin
FURTHER EXPLORATION

Every recursive algorithm can be reworked as a non-recursive algorithm. Can you
write a method that performs a non-recursive merge sort?
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

=begin
- Initialize a result arr
- Assign halves of input arr to two vars
  - Assign two empty subarrays to result arr
- Append first and second half arrs to result
- 
=end

def merge_sort(array)
  return array if array.size == 1

  sub_array_1 = array[0...array.size / 2]
  sub_array_2 = array[array.size / 2...array.size]

  sub_array_1 = merge_sort(sub_array_1)
  sub_array_2 = merge_sort(sub_array_2)

  merge(sub_array_1, sub_array_2)
end

