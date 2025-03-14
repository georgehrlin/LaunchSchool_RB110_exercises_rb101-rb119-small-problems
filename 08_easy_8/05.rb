=begin
fizzbuzz

Write a method that takes two arguments: the first is the starting number, and
the second is the ending number. Print out all numbers from the starting number
to the ending number, except if a number is divisible by 3, print "Fizz", if a
number is divisible by 5, print "Buzz", and finally if a number is divisible by
3 and 5, print "FizzBuzz".

Example:
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
=end

=begin
PEDAC
P
Input:
- Two ints
Output:
- An output of either int or str
  - ints begin with first input int and end with second input int
  - "Fizz" if int divisible by 3
  - "Buzz" if int divisible by 5
  - "FizzBuzz" if divisible by 3 and 5

E
fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz

D
Input: Two ints
Output: Outputs of int or str

A
- Iterate from first input int to second input int
  - IF num divisible by 3 and 5, output "FizzBuzz"
  - ELSIF num divisble by 3, output "Fizz"
  - ELSIF num divisble by 5, output "Buzz"
  - ELSE output num itself
=end
=begin
def fizzbuzz(num_start, num_end)
  num_start.upto(num_end) do |n|
    puts (if n % 3 == 0 && n % 5 == 0
      'FizzBuzz'
    elsif n % 3 == 0
      'Fizz'
    elsif n % 5 == 0
      'Buzz'
    else
      n
    end)
  end
end
=end
=begin
# Using case statement
def fizzbuzz(num_start, num_end)
  num_start.upto(num_end) do |n|
    puts case
    when n % 3 == 0 && n % 5 == 0
      'FizzBuzz'
    when n % 3 == 0
      'Fizz'
    when n % 5 == 0
      'Buzz'
    else
      n
    end
  end
end
=end

# I wasn't sure if the question wants the output in the exact format as it is
# shown in the code example. After skimming the answer, it does, so corrections
# are as follow:

=begin
def fizzbuzz(num_start, num_end)
  result = []
  num_start.upto(num_end) do |n|
    if n % 3 == 0 && n % 5 == 0
      result << 'FizzBuzz'
    elsif n % 3 == 0
      result << 'Fizz'
    elsif n % 5 == 0
      result << 'Buzz'
    else
      result << n
    end
  end

  puts result.join(', ')
end
=end

# Using range
def fizzbuzz(num_start, num_end)
  result = []
  for n in (num_start..num_end)
    if n % 3 == 0 && n % 5 == 0
      result << 'FizzBuzz'
    elsif n % 3 == 0
      result << 'Fizz'
    elsif n % 5 == 0
      result << 'Buzz'
    else
      result << n
    end
  end

  puts result.join(', ')
end

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
