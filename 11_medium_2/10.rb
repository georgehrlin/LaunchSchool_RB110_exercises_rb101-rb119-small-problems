=begin
Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of
the first n positive integers and the sum of the squares of the first n
positive integers.
=end

=begin
PEDAC
P
Input:
- An int
Output:
- An int that is the difference of:
  - The sqaure of the sum of the first input int positive integers
  - Minus
  - The sum of the squares of the first input int positive integers

E
sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
sum_square_difference(10) == 2640
sum_square_difference(1) == 0
sum_square_difference(100) == 25164150

D
Input: An int
Output: An int

A
- Calculate the square of the sum of the first input int positive integers
  - Calculate the sum of the first input int positive integers
    - Initialize a range object that starts with 1 and ends with input int
    - Use this range object to find sum
  - Square the sum

- Calculate the sum of the sqaures of the first input int positive integers
  - Generate a collection of the first input int positive integers
    - Use a range object then turn it into an arr
  - Use map to generate an arr of squares
  - Find the sum

- Find the difference
=end

def sum_square_difference(n)
  ((1..n).sum)**2 - (1..n).map { |n| n**2 }.sum
end

# OFFICIAL SOLUTION
def sum_square_difference(n)
  sum = 0
  sum_of_squares = 0

  1.upto(n) do |val|
    sum += val
    sum_of_squares += val**2
  end

  sum**2 - sum_of_squares
end
