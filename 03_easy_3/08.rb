=begin
Palindromic Strings (Part 2)
Write another method that returns true if the string passed as an argument is a
palindrome, false otherwise. This time, however, your method should be
case-insensitive, and it should ignore all non-alphanumeric characters.
If you wish, you may simplify things by calling the palindrome? method you
wrote in the previous exercise.

Examples:
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false
=end

=begin
PEDAC
P
Input:
- A string
Output:
- A boolean value of whether the input string is a palindrome
Explicit:
- Cases DO NOT matter
- Punctuations DO NOT matter
- Spaces DO NOT matter
- Only characters matter

E
real_palindrome?('madam') == true
real_palindrome?('Madam') == true           # (case does not matter)
real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
real_palindrome?('356653') == true
real_palindrome?('356a653') == true
real_palindrome?('123ab321') == false

D
Input:
- A string
Output:
- A boolean value

A
General:
- Remove all punctuations and spaces from input string
- Make characters of input string all lowercase
- Compare if processed input string is the same when reversed

Specific:
- Initialize an array that includes all lowercase alphabet characters
- Initialize an array that includes all digits from 0 to 9
- Combine two arrays into a new constant, alphanumeric
- When defining real_palindrome?
  - Initialize a variable, str, to store processed input string
  - Lowercase all characters in input string
  - Iterate over input string
    - If character is included in alphanumeric, append it to str
  - Check if str is the same when reversed
=end
ALPHANUMERIC = ('a'..'z').to_a + (0..9).to_a

def real_palindrome?(input)
  str = ''
  input.downcase.chars.each {|char| str << char if ALPHANUMERIC.include?(char)}
  str == str.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false
