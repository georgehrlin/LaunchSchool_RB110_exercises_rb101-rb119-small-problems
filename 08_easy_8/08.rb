=begin
Reverse It (Part 1)

Write a method that takes one argument, a string, and returns a new string with
the words in reverse order.

Examples:
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''
=end

=begin
PEDAC
P
Input:
- A str that is usually a sentence of multiple words, but can be empty also
Output:
- A new str with the words of input str reversed

E
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

D
Input: A str
Output: A str

A
- Split iput str into an arr of multiple word strs
- Initialize an empty arr to collect results
- Iterate over arr from the end
  - Append word str to result arr
- Join reulst arr into str and return it
=end

def reverse_sentence(str)
  result = []
  str.split.reverse_each { |word| result << word }
  result.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# OFFICIAL SOLUTION
def reverse_sentence(str)
  str.split.reverse.join(' ')
end
