=begin
Letter Swap

Given a string of words separated by spaces, write a method that takes this
string of words and returns a string in which the first and last letters of
every word are swapped.

You may assume that every word contains at least one letter, and that the
string will always contain at least one word. You may also assume that each
string contains nothing but words and spaces.
=end

=begin
PEDAC
P
Input:
- A string which is a sentence
  - Input string will always contain at least one word
  - Every word of the sentence contains at least one letter
  - Input string contains nothing but words and spaces
Output:
- A string of a similar sentence but with the first and last letters of every
  word swapped

E
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

D
Input: A string
Intermediary: An array of strings
Output: A string

A
General
- Convert input str into an arr of individual words
- Iterate over arr
  - Swap first and last letters of every word and append it to a new array
- Return new array
=end

def swap(sentence)
  arr = sentence.split.map do |word|
    word.size > 1 ? (word[-1] + word[1...-1] + word[0]) : word
  end
  arr.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

# OFFICIAL SOLUTION
def swap_first_last_characters(word)
  word[0], word[1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end
