=begin
Merge Sorted Lists

Write a method that takes two sorted Arrays as arguments, and returns a new
Array that contains all elements from both arguments in sorted order.

You may not provide any solution that requires you to sort the result array.
You must build the result array one element at a time in the proper order.

Your solution should not mutate the input arrays.
=end

=begin
PEDAC
P
Input:
- Two sorted arrs of undefined nums of eles
Output:
- A sorted arr that contains all of the eles from the two input arrs
Explicit:
"You must build the result array one element at a time in the proper order."
"Your solution should not mutate the input arrays."

E
merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
merge([], [1, 4, 5]) == [1, 4, 5]
merge([1, 4, 5], []) == [1, 4, 5]

D
Input: Two arrs
Output: An arr

A
Scenario
merge([1, 3, 5], [2, 4, 2]) # => [1, 2, 2, 3, 4, 5]
- Compare 1 and 2 (first pair of eles)
  - 1 smaller, so 1 is added to final arr, then 2
  - [1, 2]
- Compare 3 and 4 (second pair of eles)
  - 3 is smaller
    - Compare 3 with last ele of final arr
      - 3 is bigger than 2, so add 3 to final arr, last place
      - [1, 2, 3]
    - Compare 4 with last ele of final arr
      - 4 is bigger than 3, so add 4 to final arr, last place
      - [1, 2, 3, 4]
- Compare 5 and 2 (last pair of eles)
  - 2 is smaller
    - Compare 2 with last ele of final arr
      - 2 is smaller than 4
        - Compare 2 with second last of final arr
          - 2 is smaller than 3
            - Compare 2 with third last of final arr
              - 2 is same as 2, so add 2 to right after 2, third place
              - [1, 2, 2, 3, 4]
    - Compare 5 with last ele of final arr
      - 5 is bigger, so add 5 to final arr

Basic Ver 1
- Compare each pair of two eles of same idx from both input arrs
  - Compare smaller one with last ele of final arr
    - IF smaller one of the pair is smaller than last ele
      - Compare smaller one of the pair with second last ele of final arr
      - (Continue comparing if smaller one continues to be smaller)
    - ELSIF smaller one of the pair of bigger than last ele
      - Place it right after the final arr ele which it was just compared with
  - Compare bigger one with last ele of final arr
    - (Repeat same procedure)
- Move on to next pair and repeat this process
- Return final arr

Basic Ver 2
- Initialize a result arr and fill it with all eles of larger arr
- Iterate over smaller input arr
  - Compare each n first with last ele of larger arr
    - IF n is smaller or same
      - Compare n with second last ele of larger arr
        - (Continue process)
    - ELSE
      - Place n right after last ele of larger arr
- Return result arr
=end

=begin
def merge(arr1, arr2)
  arr_small = [arr1, arr2].min
  arr_large = [arr1, arr2].max
  arr_result = arr_large.clone

  arr_small.each do |n|
    (arr_result.size - 1).downto(0) do |idx|
      if n > arr_result[idx]
        arr_result.insert(idx + 1, n)
        break
      elsif idx == 0
        arr_result.unshift(n)
      end
    end
  end

  arr_result
end
=end

=begin
NOTE

I see that this solution technically does not meet the requirement where I
"must build the result array one element at a time in the proper order." I
was considering building the result array one element by one element, but
decided not to because I figured the key algorithm of finding the right index
to insert the new element would be the same anyway.
=end

=begin
A
- Initialize a new result arr
- Iterate over the indices of the longer input arr
  - IF the ele at current idx in arr1 is not nil
    - Use the sorting algorithm above to insert the ele at current idx into the
      right place in result arr
  - IF the ele at current idx in arr2 is not nil
    - Use the sorting algorithm above to insert the ele at current idx into the
      right place in result arr
- Return result arr
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
def merge(array1, array2)
  index2 = 0
  result = []

  array1.each do |value|
    while index2 < array2.size && array2[index2] <= value
      result << array[index2]
      index2 += 1
    end
    result << value
  end

  result.conat(array2[index2..-1])
end
