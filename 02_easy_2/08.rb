=begin
Sum or Product of Consecutive Integers
Write a program that asks the user to enter an integer greater than 0, then
asks if the user wants to determine the sum or product of all numbers between 1
and the entered integer.

Examples:
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
=end

=begin
PEDAC
P
Input:
- A user input of an integer larger than 0
- A string that is "s" or "p" for deciding to calculate the sum or product of
  all the numbers between 1 and the input integer
Output:
- An output of an interpolated string with the input integer and the sum or
  product of all the numbers between 1 and the input integer

E
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.

D
Input:
- User input: An integer
- User input: A string
Output:
- An output of a string

A
- Output a prompt for user to input an integer greater than 0
- Store user input in a var, num
- Output a prompt for user to choose between computing sum or product
- Store user input in a var, choice
- IF choice is "s"
  - Output an interpolated string with sum of all numbers between 1 and num
- ELSIF choice is "p"
  - Output an interpolated string with product of all numbers between 1 and sum
=end

def calculate_product(nums)
  product = 1
  nums.each do |num|
    product *= num
  end
  product
end

puts '>> Please enter an integer greater than 0'
num = gets.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the prouct."
choice = gets.chomp

result = 'The %s of the integers between 1 and %d is %d.'

if choice == 's'
  puts format(result, 'sum', num, (1..num).sum)
elsif choice == 'p'
  puts format(result, 'product', num, calculate_product(1..num))
else
  puts "Invalid choice. Please enter 's' or 'p'."
end
