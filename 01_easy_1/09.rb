=begin
Get Middle Character
Write a method that takes a non-empty string argument, and returns the middle
character or characters of the argument. If the argument has an odd length, you
should return exactly one character. If the argument has an even length, you
should return exactly two characters.

Examples:
center_of('I love Ruby') == 'e'
center_of('Launch School') == ' '
center_of('Launch') == 'un'
center_of('Launchschool') == 'hs'
center_of('x') == 'x'
=end

=begin
PEDAC
P
Input: A non-empty string
Output:
- If the input string is of odd number length, return the middle character
- If the input stirng is of even number length, return the two middle chars

E
center_of('I love Ruby') # => 'e'
center_of('Launch School') # => ' '
center_of('Launch') # => 'un'
center_of('Launchschool') # => 'hs'
center_of('x') # => 'x'

D
Input: A string
Intermediate: Potentially an array, but not necessary
Output: A string

A
Planning:
- Odd length
  - Input: 'abc', output: 'b', length: 3, index: 1
  - Input: '12345', output: '3', length: 5, index, 2
  - Input: 'abcdefg', output: 'd', length: 7, index, 3
- Target index is the floor of (length / 2)

- Even length
  - Input: 'abcd', output: 'bc', length: 4, index 1 & 2
  - Input: '123456', output: '34', length: 6, index 2 & 3
  - Input: 'ab', output: 'ab', length: 2, index 0 & 1
- Target indices are (length / 2) and (length / 2 - 1)


- Determine length of input string and assign it to arr length
- IF length is odd
  - Return character of input string at index the floor of (length / 2)
- ELSIF length is even
  - Return sub-string of input string from index (length / 2 - 1) and a length of 2
=end

def center_of(str)
  length = str.length
  length.odd? ? str[length / 2] : str[length / 2 - 1, 2]
end

p center_of('I love Ruby') # => 'e'
p center_of('Launch School') # => ' '
p center_of('Launch') # => 'un'
p center_of('Launchschool') # => 'hs'
p center_of('x') # => 'x'
