=begin
Double Doubles

A double number is a number with an even number of digits whose left-side
digits are exactly the same as its right-side digits. For example, 44, 3333,
103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless
the argument is a double number; double numbers should be returned as-is.

Examples:
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10
=end

=begin
PEDAC
P
Input:
- An int
Output:
- An int
  - Double input int unless input int is a double num
    - A double num has an even number of digits whose left-side digits are the
      same as its right-side digits

E
twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

D
Input: An int
Output: An int

A
- Helper: double_number?(int)
  - Convert int into str
    - 1212
      - [0..1] & [2..3]
      - [0, 2] &[2, 2]
    -123123
      - [0..2] & [3..5]
      - [0, 3] & [3, 3]
  - Compare first-half substr with second-half substr
    - half = length of int str / 2
    - int_str[0, half] == int_str[half, half]

- IF input int is a double numbe
  - Return input int
- ELSE
  - Return doubled input int
=end

def double_num?(num)
  half = num.to_s.size / 2
  num.to_s[0, half] == num.to_s[half, half] && num.to_s.size.even?
end

def twice(num)
  double_num?(num) ? num : num * 2
end

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10

# OFFICIAL SOLUTION
def twice(num)
  str_num = num.to_s
  center = str_num.size / 2
  left_half = center.zero? : '' : str_num[0..center - 1]
  right_half = str_num[center..-1]

  return num if left_half == right_half
  return num * 2
end
