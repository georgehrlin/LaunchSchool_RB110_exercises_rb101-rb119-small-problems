=begin
Capitalize Words

Write a method that takes a single String argument and returns a new string
that contains the original value of the argument with the first character of
every word capitalized and all other letters lowercase.

You may assume that words are any sequence of non-blank characters.

Examples:
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
=end

=begin
PEDAC
P
Input:
- A str that is a sentence of multiple words
  - Words are any sequence of non-blank characters
Output:
- A new str that is the same value of the input str but with every first letter
  of every word capitalized and all other letters lowercase

E
word_cap('four score and seven') == 'Four Score And Seven'
word_cap('the javaScript language') == 'The Javascript Language'
word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'

D
Input: A str
Intermediate: An arr of str
Output: A str

A
- Split input str into an arr of str
- Iterate over each str
  - Capitalize first letter of str
  - Lowercase rest of str
- Join arr of str back to a str
=end
=begin
def word_cap(sentence)
  words = sentence.split
  words.map do |word|
    word[0].upcase + word[1..-1].downcase
  end
  .join(' ')
end
=end
# OFFICIAL SOLUTION
=begin
def word_cap(words)
  words_array = words.split.map { |word| word.capitalize }
  words_array.join =(' ')
end
=end
# I didn't know that #capitalize downcases the rest of the string, oops
=begin
def word_cap(words)
  words.split.map(&:capitalize).join(' ')
end
=end
# (&:method) is shorthand for { |item| item.method }
# This shorthand syntax can work with any method that has no required arguments

=begin
FURTHER EXPLORATION

Ruby conveniently provides the String#capitalize method to capitalize strings.
Without that method, how would you solve this problem? Try to come up with at
least two solutions.
=end

=begin
A
- Iterate over each char of input str
  - IF it is either at idx 0 OR the char before it is an empty space
    - Capitalize char
  - ELSE
    - Lowercase char
=end

def word_cap(words)
  result = ''
  words.each_char.with_index do |char, idx|
    if idx == 0 || words[idx - 1] == ' '
      result << char.upcase
    else
      result << char.downcase
    end
  end

  result
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'
