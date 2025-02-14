=begin
Convert a String to a Number!

The String#to_i method converts a string of numeric characters (including an
optional plus or minus sign) to an Integer. String#to_i and the Integer
constructor (Integer()) behave similarly. In this exercise, you will create a
method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate
number as an integer. You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about
invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to
convert a string to a number, such as String#to_i, Integer(), etc. Your method
should do this the old-fashioned way and calculate the result by analyzing the
characters in the string.
=end

=begin
PEDAC
P
Input:
- A string made up of only numeric characters, nothing else
Output:
- An integer that is the exact numeric value of the input string

E
string_to_integer('4321') == 4321
string_to_integer('570') == 570

D
Input:
- A string
Output:
- An integer

A
General
- Analayze the characters making up the input string one by one and construct
  the output integer value
- Match each digit character and its corresponding decimal place based on its
  position in the string
  - Use the length of the input string (and each_with_index potentially)
- Iterate over the input string

'4321' length 4
'4' index 0, 4 * 10^3
'3' index 1, 3 * 10^2
'2' index 2, 2 * 10^1
'1' index 3, 1 * 10^0

4 * 1000 + 3 * 100 + 2 * 10 + 1 * 1
((digit character being iterated) -> digit) * 10 ** (string length - index - 1)

Specific
- Initialize an var, result, that points to 0
- Iterate over input string
  - Match digit string with digit
  - Increment result by digit * 10 ** (string length - index - 1)
- Return result
=end
=begin
def string_to_integer(numeric_str)
  str_len = numeric_str.length
  result = 0
  idx = 0

  until idx == str_len
    num = case numeric_str[idx]
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    end

    result += num * 10**(str_len - idx - 1)
    idx += 1
  end

  result
end
=end

# OFFICIAL SOLUTION
DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  p digits
  value = 0
  digits.each do |digit| 
    value = 10 * value + digit
    p value
  end
  value
end

p string_to_integer('4321') # == 4321
# p string_to_integer('570') # == 570
# p string_to_integer('2777220')
# p string_to_integer('0')
# p string_to_integer('011')
# p string_to_integer('00011')
