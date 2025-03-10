=begin
Multiplicative Average

Write a method that takes an Array of integers as input, multiplies all the
numbers together, divides the result by the number of entries in the Array, and
then prints the result rounded to 3 decimal places. Assume the array is
non-empty.

Examples:
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
=end

=begin
PEDAC
P
Input:
- An arr of int
Output:
- Output a str that contains:
  - A flt with 3 decimal places that is the result of multiplying all int in
    input arr then dividing that product by number of elements

E
show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

D
Input: An arr of int
Output: Output of a str

A
- Calculate product of multiplying all int in input arr
- Calculate quotient of dividing the product by number of elements in arr
- Output a str interpolated with quotient as flt with 3 decimal places
=end

def show_multiplicative_average(arr)
  multiplicative_average = arr.inject(:*) / arr.size.to_f
  puts format("=> The result is %.3f", multiplicative_average)
end

show_multiplicative_average([3, 5])                # => The result is 7.500
show_multiplicative_average([6])                   # => The result is 6.000
show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667
=begin
# OFFICIAL SOLUTION
def show_multiplicative_average(nums)
  product = 1.0
  nums.each { |num| product *= num }
  average = product / nums.size
  puts "=> The result is #{format('%.3f', average)}"
end
=end
# FURTHER EXPLORATION
# What happens if you omit the call to #to_f on the first line of our method?

=begin
A: If #to_f was omitted, product would point to an integer object, and it will
stay as an integer object, resulting in the use of integer division in the
calculation of average on line 4. This would eventually lead to the method
outputting a wrong result.
=end
