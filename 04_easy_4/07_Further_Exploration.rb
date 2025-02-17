=begin
FURTHER EXPLORATION

Write a hexadecimal_to_integer method that converts a string representing a
hexadecimal number to its integer value.

Example:
hexadecimal_to_integer('4D9f') == 19871
=end

=begin
PEDAC
P
Input:
- A string that represents a hexadecimal number
Output:
- An integer that is the decimal number of the hexadecimal input number

E
hexadecimal_to_integer('4D9f') == 19871
hexadecimal_to_integer('fF') == 255
hexadecimal_to_integer('E7') == 231
hexadecimal_to_integer('Af3') == 2803

D
Input: A string
Intermediary: A hash
Output: An integer

A
General
- The decimal number is the sum of the individual places of the hexadecimal
  number multiples 16 to the power of the place, with the right-most place
  starting at 0
- Initialize a hash that maps each hexadecimal number (in str) to its decimal
  value (in int)
- Convert input str into all uppercase
- Then convert it into an array of individual character
- Reverse the order of array so each character's index can be used as the power
  over 16
- Iterate over the array and accumulate the product of each character's value
  multiples by 16 to the power of its index value
=end

HEXADECIMAL_to_DECIMAL = {
  '0' => 0,  '1' => 1, '2' => 2, '3' => 3,  '4' => 4,  '5' => 5,  '6' => 6,
  '7' => 7,  '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13,
  'E' => 14, 'F' => 15
}
=begin
def hexadecimal_to_integer(hex)
  result = 0
  hex.upcase.chars.reverse.each_with_index do |char, idx|
    result += HEXADECIMAL_to_DECIMAL[char] * 16**(idx)
  end

  result
end
=end
# Using reduce
# Inspired by Bob Rodes's solution but without reading it closely
def hexadecimal_to_integer(hex)
  hex.upcase.chars.reduce(0) do |memo, char|
    16 * memo + HEXADECIMAL_to_DECIMAL[char]
  end
end

p hexadecimal_to_integer('4D9f')# == 19871
p hexadecimal_to_integer('fF')# == 255
p hexadecimal_to_integer('E7')# == 231
p hexadecimal_to_integer('Af3')# == 2803
