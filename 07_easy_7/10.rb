=begin
The End Is Near But Not Here

Write a method that returns the next to last word in the String passed to it as
an argument.

Words are any sequence of non-blank characters.

You may assume that the input String will always contain at least two words.

Examples:
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'
=end

=begin
PEDAC
P
Input:
- A str that usually represents a sentence of multiple words
Output:
- A new str that is the second-last word from input sentence str
- Words are defined as any sequence of non-blank characters
Explicit:
- Input str always contains at least two words

E
penultimate('last word') == 'last'
penultimate('Launch School is great!') == 'is'

D
Input: A str
Intermediate: An arr of strs
Output: A str

A
Solution 1
- Split input str into an arr of word strs
- Return str at second-last index of arr

Solution 2
- Split input str into an arr of wrod strs
- Iterate over arr with index
  - IF index is -2, return str
=end

def penultimate(sentence)
  sentence.split.[](-2)
  # Or: sentence.split[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'
