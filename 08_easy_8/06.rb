=begin
Double Char (Part 1)

Write a method that takes a string, and returns a new string in which every
character is doubled.

Examples:
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A new str with every char of input str doubled

E
repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

D
Input: A str
Output: A str

A
'abc'
'a' 0 'aabc'
'b' 2 'aabbc'
'c' 4 'aabbcc'

- Initialize an empty result str
- Iterate over chars of input str with index
  - Append current char to result str twice
- Return result str
=end

def repeater(str)
  result = ''
  str.each_char { |char| 2.times { result << char } }
  result
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
