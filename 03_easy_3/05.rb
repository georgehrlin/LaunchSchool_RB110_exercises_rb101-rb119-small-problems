=begin
Squaring an Argument

Using the multiply method from the "Multiplying Two Numbers" problem, write a
method that computes the square of its argument (the square is the result of
multiplying a number by itself).

Example:
square(5) == 25
square(-8) == 64
=end

=begin
PEDAC
P
Input:
- An integer
Output:
- An integer that is the square of the input integer
Explicit:
- Define a method, square
- square must call multiply from 04.rb

E
square(5) == 25  # => true
square(-8) == 64 # => true

D
Input:
- An integer
Output:
- An integer

A
- Because square of a number is product of number times itself, return calling
  multiply with two of same input intger
=end

def multiply(num1, num2)
  num1 * num2
end

def square(num)
  multiply(num, num)
end

p square(5) == 25  # => true
p square(-8) == 64 # => true
