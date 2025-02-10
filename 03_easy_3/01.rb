=begin
Arithmetic Integer
Write a program that prompts the user for two positive integers, and then
prints the results of the following operations on those two numbers: addition,
subtraction, product, quotient, remainder, and power. Do not worry about
validating the input.

Example:
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
=end

=begin
PEDAC
P
Input:
- Two user input integers
Output:
- Six interpolated string outputs that include following operations and results
  of the two input integers:
  - Addition, sum
  - Subtraction, difference
  - Multiplication, product
  - Division, quotient
  - Modulo, remainder
  - Exponentiation, product

E
==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103

D
Input: Two integers, user inputs
Output: Six strings, outputs

A
- Prompt user to enter first integer. Assign it to num1
- Prompt user to enter second integer. Assign it to num 2
- Output interpolated strings of corresponding operations and results
=end

puts '==> Enter the first number:'
num1 = gets.to_f#.to_i

puts '==> Enter the second number:'
num2 = gets.to_f#to_i

puts "==> #{num1} + #{num2} = #{num1 + num2}"
puts "==> #{num1} - #{num2} = #{num1 - num2}"
puts "==> #{num1} * #{num2} = #{num1 * num2}"
puts "==> #{num1} / #{num2} = #{num1 / num2}"
puts "==> #{num1} % #{num2} = #{num1 % num2}"
puts "==> #{num1} ** #{num2} = #{num1 ** num2}"
