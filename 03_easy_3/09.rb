=begin
Palindromic Numbers

Write a method that returns true if its integer argument is palindromic, false
otherwise. A palindromic number reads the same forwards and backwards.

Examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true
=end

=begin
PEDAC
P
Input:
- An integer
Output:
- A boolean value of whether the input integer is a palindromic number
  - A palindromic number reads the same forwards and backwards

Examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

D
Input:
- An integer
Output:
- A boolean value
Intermediary:
- A string

A
General:
- Turn input integer into a string and check whether it is a palindrome
=end

def palindromic_number?(input)
  input.to_s == input.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

=begin
FURTHER EXPLORATION

Suppose your number begins with one or more 0s. Will your method still work?
Why or why not? Is there any way to address this?
=end

=begin
A: My method won't work if the input integer begins with one or more 0s.
Frankly I don't fully understand why. My guess is with 0s at the beginning of
a number, it is recognized not as a decimal number but a number of a different
base. There's gotta be a way but I don't know.
=end
