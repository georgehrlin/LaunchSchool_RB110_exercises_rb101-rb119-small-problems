=begin
Is It Prime?

Write a method that takes a positive integer as an argument and returns true if
the number is prime, false if it is not prime.

You may not use Ruby's Prime class to solve this problem. Your task is to
programmatically determine whether a number is prime without relying on any
methods that already do that for you.
=end

=begin
PEDAC
P
Input:
- An int
Output:
- A bol of whether the input int is a prime num or not

E
puts(is_prime(1) == false)              # true
puts(is_prime(2) == true)               # true
puts(is_prime(3) == true)               # true
puts(is_prime(4) == false)              # true
puts(is_prime(5) == true)               # true
puts(is_prime(6) == false)              # true
puts(is_prime(7) == true)               # true
puts(is_prime(8) == false)              # true
puts(is_prime(9) == false)              # true
puts(is_prime(10) == false)             # true
puts(is_prime(23) == true)              # true
puts(is_prime(24) == false)             # true
puts(is_prime(997) == true)             # true
puts(is_prime(998) == false)            # true
puts(is_prime(3_297_061) == true)       # true
puts(is_prime(23_297_061) == false)     # true

D
Input: An int
Output: A bol

A
- 1 is not prime
- Iterate over nums 1 to input int
  - IF the only num that evenly divide input int is 1 and input int itself
    - Return true

- Generate a collection of nums 2 to (input int - 1)
- Use any? to check if any of nums in collection evenly divides input int
=end

=begin
def is_prime(n)
  n == 1 ? false : !(2..(n - 1)).any? { |factor| n % factor == 0 }
end
=end

# OFFICIAL SOLUTIONS
def is_prime(n)
  return false if n == 1

  (2..(n - 1)).each do |divisor|
    return false if n % divisor == 0
  end

  return true
end

def is_prime(n)
  return false if n == 1
  (2..Math.sqrt(n)).each do |divisor|
  # The largest possible num that can be a divisor is the square root
    return false if n % divisor == 0
  end

  return true
end

# By Tiia Rikama
def is_prime(n)
  return false if n == 1
  (2...n).none? { |divisor| n % divisor == 0 }
end
