=begin
Repeat Yourself
Write a method that takes two arguments, a string and a positive integer, and
prints the string as many times as the integer indicates.

Example:
repeat('Hello', 3)

Output:
Hello
Hello
Hello

PEDAC
P
Input: A string and an integer
Output: Output the string the input integer number of times

E
repeat('Hello', 3)
# Output:
# Hello
# Hello
# Hello

D
Input: A string and an integer
Output: nil

A
- Create a loop that iterates input integer number of times
  - Output string
=end

def repeat(str, int)
  int.times { puts str }
end

repeat('Hello', 3)
