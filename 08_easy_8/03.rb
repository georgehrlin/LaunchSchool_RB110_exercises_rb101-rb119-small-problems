=begin
All Substrings

Write a method that returns a list of all substrings of a string. The returned
list should be ordered by where in the string the substring begins. This means
that all substrings that start at position 0 should come first, then all
substrings that start at position 1, and so on. Since multiple substrings will
occur at each position, the substrings at a given position should be returned
in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the
previous exercise:

Examples:
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
=end

=begin
PEDAC
P
Input:
- A str
Output:
- An arr of strs that are all the possible substrs of input str

E
substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

D
Input: A str
Output: An arr of strs

A
- Initialize an empty arr to collect substrs
- Initialize a var that works as index tracker and points to 0
- Iterate over chars of input str with index
  - Iterate str size - index tracker times
    - Append substr from index (index tracker) to (iterator number) to result
  - Index tracker increments by 1
- Return result arr
=end

def substrings(str)
  result = []
  str.chars.each_index do |idx|
    (str.size - idx).times do |n|
      result << str[idx..(idx + n)]
    end
  end

  result
end

p substrings('abcde')

=begin
# Combination of previous (but modified) solutions by Nick Johnson and Seaweed
def leading_substrings(str)
  str.size <= 1 ? [str] : [*leading_substrings(str.chop), str]
end

def substrings(str)
  Array.new(str.size) { |n| leading_substrings(str[n..-1]) }.flatten
end
=end

# OFFICIAL SOLUTION
def substrings(string)
  results = []
  (0...string.size).each do |start_index|
    this_substring = string[start_index..-1]
    results.concat(leading_substrings(this_substring))
  end

  results
end
