=begin
Leading Substrings

Write a method that returns a list of all substrings of a string that start at
the beginning of the original string. The return value should be arranged in
order from shortest to longest substring.

Examples:
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
=end

=begin
PEDAC
P
Input:
- A str
Output:
- An arr of all substrs of input str that start at the beginning of the input
  str
Explicit:
- Strs of returned arr should be in order from shortest to longest

E
leading_substrings('abc') == ['a', 'ab', 'abc']
leading_substrings('a') == ['a']
leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']

D
Input: A str
Output: An arr of strs

A
- Initialize an empty arr to collect result strs
- Iterate for input str size number of times
 - Append substr from index 0 to index (iterator number) to result arr
- Return result arr
=end

=begin
def leading_substrings(str)
  result = []
  str.size.times { |n| result << str[0..n] }
  result
end
=end

=begin
# Another solution
def leading_substrings(str)
  str.chars.map.with_index { |_, idx| str[0..idx] }
end
=end

=begin
# Another solution
def leading_substrings(str)
  str.each_char.with_index.with_object([]) do |(_, idx), arr|
    arr << str[0..idx]
  end
end
=end

# OFFICIAL SOLUTION
def leading_substrings(string)
  result = []
  0.upto(string.size - 1) do |index|
    result << string.slice(0..index)
  end
  result
end

p leading_substrings('abc') # == ['a', 'ab', 'abc']
p leading_substrings('a') # == ['a']
p leading_substrings('xyzzy') # == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
