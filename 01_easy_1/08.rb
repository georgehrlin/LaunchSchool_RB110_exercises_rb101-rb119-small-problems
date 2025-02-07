=begin
Reverse the Digits in a Number
Write a method that takes a positive integer as an argument and returns that
number with its digits reversed.
Don't worry about arguments with leading zeros - Ruby sees those as octal
numbers, which will cause confusing results. For similar reasons, the return
value for our fourth example doesn't have any leading zeros.

Examples:
reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1
=end

=begin
PEDAC
P
Input: An integer, no leading zeros
Output: An integer the digits of which are in reverse order to the input

E
reversed_number(12345) # => 54321
reversed_number(12213) # => 31221
reversed_number(456) # => 654
reversed_number(12000) # => 21 # No leading zeros in return value!
reversed_number(12003) # => 30021
reversed_number(1) # => 1

D
Input: An integer
Intermediate: Potentially an array, but not necessary
Output: An integer

A
Solution I
- Convert input integer to string and call String#reverse
- Convert return value of String#reverse back to integer

Solution II
- Initialize an array, result
- Convert input integer to string and assign it to var str
- Split str into an array of individual digits and assign it to var arr
- Loop over arr
  - Prepend each digit to result
- Combine result into a string
- Convert result back to an integer
- Return result
=end

def reversed_number_1(num)
  num.to_s.reverse.to_i
end

p reversed_number_1(12345) # => 54321
p reversed_number_1(12213) # => 31221
p reversed_number_1(456) # => 654
p reversed_number_1(12000) # => 21 # No leading zeros in return value!
p reversed_number_1(12003) # => 30021
p reversed_number_1(1) # => 1

def reversed_number_2(num)
  result = []
  str = num.to_s
  arr = str.split('')
  arr.each { |digit| result.prepend(digit)}
  result.join.to_i
end

p reversed_number_2(12345) # => 54321
p reversed_number_2(12213) # => 31221
p reversed_number_2(456) # => 654
p reversed_number_2(12000) # => 21 # No leading zeros in return value!
p reversed_number_2(12003) # => 30021
p reversed_number_2(1) # => 1

# SOLUTION BY BOB RODES
def reversed_number_3(num)
  num.digits.join.to_i
end

p reversed_number_3(12345) # => 54321
p reversed_number_3(12213) # => 31221
p reversed_number_3(456) # => 654
p reversed_number_3(12000) # => 21 # No leading zeros in return value!
p reversed_number_3(12003) # => 30021
p reversed_number_3(1) # => 1
