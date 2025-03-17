=begin
How long are you?

Write a method that takes a string as an argument, and returns an Array that
contains every word from the string, to which you have appended a space and the
word length.

You may assume that words in the string are separated by exactly one space, and
that any substring of non-space characters is a word.

Examples:
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []
=end

=begin
PEDAC
P
Input:
- A str that is a sentece of multiple words
Output:
- An arr of strs
  - Each str is each word in input sentence str followed by a space and a num
    that represents the word str's length

E
word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

word_lengths("") == []

D
Input: A str
Output: An arr of strs

A
- Initialize an empty reseult arr
- Split input str into an arr of word strs
- Iterate over arr of strs
  - Concat a sapce and num of size of word str to word str, then append it to
    result arr
=end

def word_lengths(sentence)
  sentence.split.map { |word| word += " #{word.size}" }
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []
