=begin
Swap Case

Write a method that takes a string as an argument and returns a new string in
which every uppercase letter is replaced by its lowercase version, and every
lowercase letter by its uppercase version. All other characters should be
unchanged.

You may not use String#swapcase; write your own version of this method.

Examples:
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
=end

=begin
PEDAC
P
Input:
- A str that can be a word or sentence
Output:
- A str that has the same value of input str but with all cases inverted

E
swapcase('PascalCase') == 'pASCALcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'

D
Input: A str
Output: A str

A
- Initialize a hsh with uppercase letters as key and lowercase letters as val
- Initialize a hsh with lowercase letters as key and uppercase letters as val
- Split input str into an arr of individual words
- Iterate over arr of words
  - Initialize an empty result str to collect result
  - Iterate over the char of each word
    - IF char is uppercase
      - Use first hsh to convert it to lowercase
      - Append it to result str
    - ELSIF char is lowercase
      - Use second hsh to convert it to uppercase
      - Append it to result str
    - Return result str
- Join arr into str and return it
=end
require 'pry-byebug'

UPPPER_LOWER = ('A'..'Z').zip('a'..'z').to_h
LOWER_UPPER = UPPPER_LOWER.invert

def swapcase(str)
  arr_word = str.split(' ')
  arr_transformed_word = arr_word.map do |word|
    transformed_word = ''
    word.each_char do |char|
      if ('A'..'Z').include?(char)
        transformed_word << UPPPER_LOWER[char]
      elsif ('a'..'z').include?(char)
        transformed_word << LOWER_UPPER[char]
      else
        transformed_word << char
      end
    end
    transformed_word
  end
  arr_transformed_word.join(' ')
end

# OFFICIAL SOLUTION
def swapcase(string)
  characters = string.chars.map do |char|
    if char =~ /[a-z]/
      char.upcase
    elsif char =~ /[A-Z]/
      char.downcase
    else
      char
    end
  end
  characters.join
end

p swapcase('PascalCase') # == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV')# == 'tONIGHT ON xyz-tv'
