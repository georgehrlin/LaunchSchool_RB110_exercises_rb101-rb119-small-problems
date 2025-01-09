=begin
PEDAC

Short Long Short
Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter string,
the longer string, and the shorter string once again. You may assume that the
strings are of different lengths.

Input: Two strings of different lengths
Output: A string that consists of the shorter string, the longer string, then
        the shorter string again

Rules:
- Assume that the two arguments strings are of different lengths

Examples:
short_long_short('abc', 'defgh') == "abcdefghabc" # => true
short_long_short('abcde', 'fgh') == "fghabcdefgh" # => true
short_long_short('', 'xyz') == "xyz"              # => true

Data Structure:
- Input is two strings
- Output is a string

Algorithm:
- Create a variable `str_s`that will reference the shorter string
- Create a variable `str_l` that will reference the longer string
- Compare the lengths of the two argument strings
  - Assign the shorter string to `str_s`
  - Assign the longer string to `str_l`
- Return the concatenation of `str_s`, `str_l`, and `str_s`
=end

=begin
def short_long_short(str1, str2)
  str_s = nil
  str_l = nil

  str_s = str1.length < str2.length ? str1 : str2
  str_l = str1.length < str2.length ? str2 : str1

  "#{str_s}#{str_l}#{str_s}"
end
=end

=begin
# Official Solution 1
def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end
=end

# Refractoring Official Solution 1 with Ternary Operator
def short_long_short(str1, str2)
  (str1.length < str2.length) ? "#{str1}#{str2}#{str1}" : "#{str2}#{str1}#{str2}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc" # => true
p short_long_short('abcde', 'fgh') == "fghabcdefgh" # => true
p short_long_short('', 'xyz') == "xyz"              # => true

=begin
# Official Solution 2
def short_long_short(str1, str2)
  arr = [str1, str2].sort_by { |str| str.length }
  arr.first + arr.last + arr.first
end
# "This method is perhaps too clever for its own good and makes it hard to
# understand what this method is trying to do."
=end

=begin
# Solution by James Duot
def short_long_short(str1, str2)
  short, long = [str1, str2].sort(&:size)
  short + long + short
end
=end