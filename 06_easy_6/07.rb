=begin
Halvsies

Write a method that takes an Array as an argument, and returns two Arrays (as a
pair of nested Arrays) that contain the first half and second half of the
original Array, respectively. If the original array contains an odd number of
elements, the middle element should be placed in the first half Array.

Examples:
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halvsies([5]) == [[5], []] # true
p halvsies([]) == [[], []] # true
=end

=begin
PEDAC
P
Input:
- An arr
Output:
- A nested arr with two arr that are the input arr split in halves
  - If input arr contains odd number of elements, the middle element should be
    in the first nested arr

E
p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]] # true
p halvsies([1, 2, 3, 4, 1]) == [[1, 2, 3], [4, 1]] # true
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]] # true
p halvsies([5]) == [[5], []] # true
p halvsies([]) == [[], []] # true

D
Input: An arr
Output: A nested arr with two sub-arr

A
(Odd number of elements)
arr = [1, 2, 3, 4, 5]
Size: 5
arr.size / 2 => 2

arr[0, 3] => [1, 2, 3]
arr[3, 2] => [4, 5]

arr[0..2] => [1, 2, 3]
arr[3..4] => [4, 5]

(Even number of elements)
arr = [1, 2, 3, 4]
Size: 4
arr.size / 2 => 2

arr[0, 2] => [1, 2]
arr[2, 2] => [3, 4]

arr[0..1] => [1, 2]
arr[2..3] => [3, 4]

- Initialize an arr with two empty sub-arr to collect result
- Divide size of input arr by 2 to find index of middle element
- Iterate over input arr using index
  - IF index < index of middle element
    - Append the element to first sub-arr
  - ELSIF index = index of middle element
    - IF input arr contains odd number of elements
      - Append the element to first sub-arr
    - ELSE
      - Append the element to second sub-arr
  - ELSE
    - Append the element to second sub-arr
=end

def halvsies(arr)
  result = [[], []]
  idx_middle = arr.size / 2
  arr.each_with_index do |element, idx|
    if idx < idx_middle
      result[0] << element
    elsif idx == idx_middle
      if arr.size.odd?
        result[0] << element
      else
        result[1] << element
      end
    else
      result[1] << element
    end
  end

  result
end

=begin
# OFFICIAL SOLUTION
def halvsies(arr)
  middle = (arr.size / 2.0).ceil
  first_half = arr.slice(0, middle)
  second_half = arr.slice(middle, arr.size - middle)
  [first half, second_half]
end
=end
# FURTHER EXPLORATION
# Can you explain why our solution divides array.size by 2.0 instead of just 2?

# A: Given an argument array with an odd number of elements, dividing the
# number of arguments by 2 (not 2.0) gives an integer that is the floor of the
# quotient of the division. It is 1 short of the number of elements that are
# supposed to be in the first subarray. However, if the divisor is a float
# (2.0), the quotient becomes a quote with decimal numbers, and once ceil is
# called on it, it yields the right number of elements to be appended in the
# first subarray.

# What solution did you end up with? Was it similar or entirely different?

# A: The algorithm of my solution was similar at a higher level. Both my
# solution and the official solution are about slicing the input array into
# two subarrays with the right number of elements. I didn't realize that I
# could've called ceil on the result of dividing the number of input array
# elements by 2.0 (instead of just 2) to find the number of elements for the
# first subarray, so I went for appending each element to the different
# subarrays based on its index.
