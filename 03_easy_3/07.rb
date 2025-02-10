=begin
Palindromic Strings (Part 1)

Write a method that returns true if the string passed as an argument is a
palindrome, false otherwise. A palindrome reads the same forward and backward.
For this exercise, case matters as does punctuation and spaces.
=end

=begin
PEDAC
P
Input:
- A string
Output:
- true/false of whether the input string is a palindrome
  - A palindrome reads the same forward and backward
Explicit:
- Case matters
- All characters matter

E
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

D
Input:
- A string
Output:
- A boolean value

A
- Because a valid palindrome is a string that reads the same forward and
  backward, a string that is a palindrome remains the same string if it is
  reversed. Therefore, I can check if the string remains the same even if it is
  reversed
=end

def palindrome_str?(str)
  str == str.reverse
end
=begin
p palindrome_str?('madam') == true
p palindrome_str?('Madam') == false          # (case matters)
p palindrome_str?("madam i'm adam") == false # (all characters matter)
p palindrome_str?('356653') == true
=end
=begin
FURTHER EXPLORATION

Write a method that determines whether an array is palindromic; that is, the
element values appear in the same sequence both forwards and backwards in the
array.
=end

def palindrome_arr?(arr)
  arr == arr.reverse
end

p palindrome_str?('madam'.chars) == true
p palindrome_str?('Madam'.chars) == false          # (case matters)
p palindrome_str?("madam i'm adam".chars) == false # (all characters matter)
p palindrome_str?('356653'.chars) == true

=begin
FURTHER EXPLORATION

Now write a method that determines whether an array or a string is palindromic;
that is, write a method that can take either an array or a string argument, and
determines whether that argument is a palindrome. You may not use an if,
unless, or case statement or modifier.
=end

def palindrome?(input)
  input == input.reverse
end

p palindrome?('madam') == true
p palindrome?('Madam') == false          # (case matters)
p palindrome?("madam i'm adam") == false # (all characters matter)
p palindrome?('356653') == true
p palindrome?('madam'.chars) == true
p palindrome?('Madam'.chars) == false          # (case matters)
p palindrome?("madam i'm adam".chars) == false # (all characters matter)
p palindrome?('356653'.chars) == true
