=begin
Letter Counter (Part 1)

Write a method that takes a string with one or more space separated words and
returns a hash that shows the number of words of different sizes.

Words consist of any string of characters that do not include a space.
=end

=begin
PEDAC
P
Input:
- A string that is a sentence which consits of words separated by spaces
Output:
- A hash with keys that are the sizes of words in the input string and values
  that are the respective quantities of words of those sizes
Implicit:
- Punctuation is included and counted as part of the length a word

E
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

D
Input:
- A string
Intermediary:
- String
Output:
- A hash
  - Keys are integers
  - Values are integers

A
General
- Convert input string into an arr of individual words
- Initialize var, result, that collects key-value pairs
- Iterate over arr of words
  - Append following key-value pair to result
    - Key: Size of word
    - Value: num_str_of_a_size(word.size)
- Sort result
- Return result
=end

=begin
Helper Method
Given an array of strings of multiple sizes, return the number of strings of a
given size
num_str_of_a_size(['Four', 'score', 'and', 'seven.'], 4) # => 1
num_str_of_a_size(['Hey', 'diddle', 'diddle', 'the', 'cat', 'and', 'the', 'fiddle!'], 6) # => 2

- Initialize a var, result, that collects the number of strings of the given
  size
- Iterate over arr
  - IF size of word is same as input integer
    - Increment result by 1
- Return result
=end

def num_str_of_a_size(arr, size)
  result = 0
  arr.each { |word| result += 1 if word.size == size }

  result
end

p num_str_of_a_size(['Four', 'score', 'and', 'seven.'], 4) # => 1
p num_str_of_a_size(['Hey', 'diddle', 'diddle', 'the', 'cat', 'and', 'the', 'fiddle!'], 6) # => 2

def word_sizes(text)
  arr_words = text.split
  result = arr_words.each_with_object({}) do |word, result|
    result[word.size] = num_str_of_a_size(arr_words, word.size)
  end
  result.sort.to_h
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') # == {}

# OFFICIAL SOLUTION
def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each { |word| counts[word.size] += 1 }

  counts
end

=begin
If we initialize count as:
count = {}
we will get an exception the first time counts[word.size] += 1 is executed.

This is because that element doesn't exist yet, so counts[word.size] returns
nil, and nil cannot be added to 1.

To fix this, we use the default value from initializing counts:
counts = Hash.new(0)

This forces any references to non-existing keys in counts to return 0.
=end
