=begin
Convert a String to a Signed Number!

In the previous exercise, you developed a method that converts simple numeric
strings to Integers. In this exercise, you're going to extend that method to
work with signed numbers.

Write a method that takes a String of digits, and returns the appropriate
number as an integer. The String may have a leading + or - sign; if the first
character is a +, your method should return a positive number; if it is a -,
your method should return a negative number. If no sign is given, you should
return a positive number.

You may assume the string will always contain a valid number.

You may not use any of the standard conversion methods available in Ruby, such
as String#to_i, Integer(), etc. You may, however, use the string_to_integer
method from the previous lesson.
=end

=begin
PEDAC
P
Input:
- A string that represents a valid positive/negative number, nothing else
Output:
- An integer that is the numeric value of the input string
Explicit:
- Return a positive/negative integer if the input string leads with +/-
- Return a positive integer if the input string does not lead with a sign

E
string_to_signed_integer('4321') == 4321
string_to_signed_integer('-570') == -570
string_to_signed_integer('+100') == 100

D
Input:
- A string
Output:
- An integer

A
General
- Check if the first character of input string is +, -, or there is no sign
  - If it is + or there is no sign
    - Calculate and return its numeric value
  - Else if it is -
    - Calculate and return its numeric value with subtraction version of
      calculation algorithm
=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}
=begin
def string_to_signed_integer(num_str)
  case num_str.chars.first
  when '+'
    num_str.chars.[](1..-1).reduce(0) do |memo, char|
      10 * memo + DIGITS[char]
    end
  when '-'
    num_str.chars.[](1..-1).reduce(0) do |memo, char|
      10 * memo - DIGITS[char]
    end
  else
    num_str.chars.reduce(0) do |memo, char|
      10 * memo + DIGITS[char]
    end
  end
end
=end
# OFFICIAL SOLUTION
def string_to_integer(string)
  value = 0
  string.chars.each { |char| value = 10 * value + DIGITS[char] }
  value
end

def string_to_signed_integer(string)
  case string[0]
  when '-' then -string_to_integer(string[1..-1])
  when '+' then  string_to_integer(string[1..-1])
  else           string_to_integer(string)
  end
end

