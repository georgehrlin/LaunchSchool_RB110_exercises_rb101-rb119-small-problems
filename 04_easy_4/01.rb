=begin
Short Long Short

Write a method that takes two strings as arguments, determines the longest of
the two strings, and then returns the result of concatenating the shorter
string, the longer string, and the shorter string once again. You may assume
that the strings are of different lengths.
=end

=begin
PEDAC
P
Input:
- A string
- A string (of a different length)
Output:
- A string consisting first the shorter string, then the longer string, then
  the shorter string again

E
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

D
Input:
- A string
- A string
Output:
- A string

A
General:
- Determine the longer string. Assign it to a variable, long
- Assign the other string to variable, short
- Return an interpolated string: short+long+short
=end
=begin
def short_long_short(str1, str2)
  short, long = [str1, str2].sort { |a, b| a.size <=> b.size }
  "#{short}#{long}#{short}"
end
=end
def short_long_short(str1, str2)
  short, long = [str1, str2].sort_by { |str| str.size }
  "#{short}#{long}#{short}"
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
=begin
# OFFICIAL ANSWER
def short_long_short(str1, str2)
  if str1.length > str2.length
    str2 + str1 + str2
  else
    str1 + str2 + str1
  end
end
=end
