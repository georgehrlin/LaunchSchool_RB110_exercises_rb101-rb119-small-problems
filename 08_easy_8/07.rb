=begin
Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every
consonant character is doubled. Vowels (a,e,i,o,u), digits, punctuation, and
whitespace should not be doubled.

Examples:
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A str with every consonant char of input str doubled

E
double_consonants('String') == "SSttrrinngg"
double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
double_consonants("July 4th") == "JJullyy 4tthh"
double_consonants('') == ""

D
Input: A str
Output: A str

A
- Initialize a collection of consonants
- Initialize an empty result str
- Iterate over every char of input str
  - IF char is a consonant
    - Append char to result str twice
  - ELSE
    - Append char to result once
- Return reesult
=end

ALPHABET_UPPER = ('A'..'Z').to_a
ALPHABET_LOWER = ('a'..'z').to_a
ALPHABET = ALPHABET_UPPER + ALPHABET_LOWER
VOWELS = %w[A E I O U a e i o u]
CONSONANTS = ALPHABET.difference(VOWELS)

def double_consonants(str)
  result = ''
  str.each_char do |char|
    if CONSONANTS.include?(char)
      result << char << char
    else
      result << char
    end
  end

  result
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""

# OFFICIAL SOLUTION
CONSONANTS = %w[b c d f g h j k l m n p q r s t v w x y z]

def double_consonants(str)
  result = ''
  str.each_char do |char|
    result << char
    result << char if CONSONANTS.include?(char.downcase)
    result
end
