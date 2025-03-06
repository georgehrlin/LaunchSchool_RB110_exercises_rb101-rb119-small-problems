=begin
Delete vowels

Write a method that takes an array of strings, and returns an array of the same
string values, except with the vowels (a, e, i, o, u) removed.

Example:
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
=end

=begin
PEDAC
P
Input:
- An arr of str
Output:
- An arr of same str but with each str's vowels removed

E
remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

D
Input: An arr of str
Output: An arr of str

A
- Initialize an empty result arr
- Iterate over each str of input arr
  - Iterate over each char of str
    - IF char is a vowel
      - Remove it from str
  - Append modified str to result arr
- Return arr
=end

VOWELS = %w(a e i o u A E I O U)

def remove_vowels(strings)
  strings.map do |string|
    string.each_char do |char|
      string.slice!(char) if VOWELS.include?(char)
    end
  end
end

# OFFICIAL SOLUTION
def remove_vowels(strings)
  strings.map { |string| string.delete('aeiouAEIOU') }
end
