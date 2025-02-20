=begin
Letter Counter (Part 2)

Modify the word_sizes method from the previous exercise to exclude non-letters
when determining word size. For instance, the length of "it's" is 3, not 4.

Examples
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}
=end

=begin
PEDAC
P
Input:
- A string that is a sentence consists of multiple words and etc.
Output:
- A hash with lengths of words as keys and numbers of respective words of those
  lengths as values
Explicit:
- Exclude non-alphabetic characters when determining the length of a word

E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
word_sizes('') == {}

D
Input: A string
Intermediary: Individual strings
Output: A hash, integers as keys, integers as values

A
- Initialize an empty hash to collect results
- Break up input string into an array of word strings
- Iterate over individual words and return a new arr with each word str's non-
  alphabetic chars removed
- Iterate over new arr of modified individual words
  - Remove non-alphabetic chars in word string
  - Determine length of word string
  - Determine number of word strings with such length in arr and append key-val
    pair of result hash
- Return result hash
=end
=begin
def word_sizes(sentence)
  words = sentence.split.map { |str| str.delete('^A-Za-z') }
  words.map { |word| word.length }.tally
end
=end
# Without tally
def word_sizes(sentence)
  words = sentence.split.map { |str| str.delete('^A-Za-z') }
  words.each_with_object(Hash.new(0)) do |word, result|
    result[word.length] += 1
  end
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") # == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') # == {}

# OFFICIAL SOLUTION
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    clean_word = word.delete('^A-Za-z')
    counts[clean_word.length] += 1
  end

  counts
end
