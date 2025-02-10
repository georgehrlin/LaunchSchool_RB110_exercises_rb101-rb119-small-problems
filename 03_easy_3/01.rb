=begin
Searching 101

Write a program that solicits 6 numbers from the user, then prints a message
that describes whether or not the 6th number appears amongst the first 5
numbers.

Examples:
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].
=end

=begin
PEDAC
P
Input:
- Six user inputs that are all integers
Output:
- An output of a string that tells the user whether the last input integer is
  among the first five integers

D
Input:
- Six integers, user inputs
Output:
- One string, an output

A
- Initialize an array, nums, that collects user input integers
- Prompt user to input 6 integers
- Append each user input integer to nums
- Output a string that tells whether first five input integers includes last
  one
=end
=begin
nums = []

puts "==> Enter the 1st number:"
nums << gets.to_i

puts "==> Enter the 2nd number:"
nums << gets.to_i

puts "==> Enter the 3rd number:"
nums << gets.to_i

puts "==> Enter the 4th number:"
nums << gets.to_i

puts "==> Enter the 5th number:"
nums << gets.to_i

puts "==> Enter the last number:"
nums << gets.to_i

puts "The number #{nums.last} " \
     "#{nums[0..-2].include?(nums.last) ? 'appears' : 'does not appear'} " \
     "in #{nums[0..-2]}."
=end

nums = []

%w[1st 2nd 3rd 4th 5th last].each do |nth|
  puts "==> Enter the #{nth} number: "
  nums << gets.to_i
end

puts "The number #{nums.last} " \
     "#{nums[0..-2].include?(nums.last) ? 'appears' : 'does not appear'} " \
     "in #{nums[0..-2]}."
