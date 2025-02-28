=begin
List of Digits

Write a method that takes one argument, a positive integer, and returns a list
of the digits in the number.

Examples:
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true
=end

=begin
PEDAC
P
Input:
- A positive integer
Output:
- An array of integers that are the digits of the input integer

E
puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

D
Input: An integer
Intermediary: Potentially string
Output: An array of integers

A
- Initialize an empty arr to collect result
- Convert input integer to a str
- Iterate over each char of str
  - Convert each char to int and append it to result arr
- Return result arr
=end

def digit_list(int)
  digits = []
  int.to_s.each_char { |char| digits << char.to_i }
  digits
end

puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true

# I skimmed Official Solution and realized it shows a brute-force solution
# I will attempt that myself first
