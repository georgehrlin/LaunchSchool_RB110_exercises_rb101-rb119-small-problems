=begin
Rotation (Part 2)
Write a method that can rotate the last n digits of a number.

Examples:
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.
You may use the rotate_array method from the previous exercise if you want.
You may assume that n is always a positive integer.
=end

=begin
PEDAC
P
Input:
- Two ints
  - First input int is the original number
  - Second input int indicates the number of last digits to be rotated
Output:
- An int that is the input int but with the last (second input int) number
  of digits rotated

E
rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

D
Input: Two ints
Output: An int

A
- Turn first input int into an arr of digit ints
- Call rotate_array on the last (secodn input int) number of elements
- Combine two parts
=end

def rotate_array(arr)
  result = arr.dup
  result << result.shift
end

def rotate_rightmost_digits(num, num_rightmost)
  digits_of_num = num.digits.reverse
  digits_unchanged = digits_of_num[0...-num_rightmost]
  digits_rotated = rotate_array(digits_of_num[-num_rightmost..-1])
  (digits_unchanged + digits_rotated).join.to_i
end

# OFFICIAL SOLUTION
def rotate_rightmost_digits(number, n)
  all_digits = number.to_s.chars
  all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
  all_digits.join.to_i
end

# By Philip Knapp
def rotate_rightmost_digits(num, digits)
  digit_list = num.to_s.chars
  digit_list.push(digit_list.delete_at(-digits))
  digit_list.join.to_i
end

# By Seaweed
def rotate_rightmost_digits(n, num_to_rotate)
  split_point = 10**num_to_rotate
  left, right = n.divmod(split_point)

  right   = right.divmod(split_point / 10)
  rotated = right.last * 10 + right.first
  rotated += (left * split_point)
end
