=begin
Multiples of 3 and 5

Write a method that searches for all multiples of 3 or 5 that lie between 1 and
some other number, and then computes the sum of those multiples. For instance,
if the supplied number is 20, the result should be 98
(3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.
=end

=begin
PEDAC
P
Input:
- An integer greater than 1
Output:
- The sum of all multiples of 3 or 5 that are between 1 and the input integer

E
multisum(3) == 3
multisum(5) == 8
multisum(10) == 33
multisum(1000) == 234168

D
Input: An integer
Output: An integer

A
General
- Find all the multiples of 3 or 5 smaller than the input integer
- Sum them up

Specific
- Initialize an array, multiples, that collects multiples of 3 or 5
- Iterate over a range that begins with 1 and ends with input integer
  - Check if the integer being iterated is a multiple of 3 or 5
    - If it is, append it to multiples
- Return sum of multiples
=end

def multisum(num)
  multiples = []
  (1..num).each { |num| multiples << num if (num % 3 == 0 || num % 5 == 0) }
  multiples.sum
end

# OFFICIAL SOLUTION
def multiple?(number, divisor)
  number % divisor == 0
end

def multisum(max_value)
  sum = 0
  1.upto(max_value) do |number|
    sum += number if multiple?(number, 3) || multiple?(number, 5)
  end
  sum
end

p multisum(2)
p multisum(3) # == 3
p multisum(5) # == 8
p multisum(10) # == 33
p multisum(1000) # == 234168
