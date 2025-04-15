=begin
Next Featured Number Higher than a Given Value

A featured number (something unique to this exercise) is an odd number that is
a multiple of 7, and whose digits occur exactly once each. So, for example, 49
is a featured number, but 98 is not (it is not odd), 97 is not (it is not a
multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next
featured number that is greater than the argument. Return an error message if
there is no next featured number.
=end

=begin
PEDAC
P
Input:
- An int
Output:
- An int that is the next featured num greater than the input int
- A featured num is:
  - Odd
  - Multiple of 7
  - Its digits do not repeat
- Output an error msg str if the next featured num does not exist

E
featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987
featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

D
Input: An int
Output: An int (or output of a str)

A
- A valid featured num is:
  - > input int
  - Odd
  - Multiple of 7
  - Digits do not repeat
  - <= 9876543201

- The largest featured num cannot be more than 9876543201
  - It is not 9876543210, because it is not odd
  - Without any of the digit repeating, the next largest possible num is
    9876543201, which is a featured num
  - Adding any more digit will cause this number to have repeating digits

- Increase input int by 1 and check if it's the next featured number
  - IF yes, return it
  - IF not, keep increasing by 1 and check again
=end

def featured_num?(n)
  n.odd? && n % 7 == 0 && n.to_s.chars.uniq.size == n.to_s.chars.size
end

def featured(n)
  if n > 9876543201
    puts 'There is no possible number that fulfills those requirements'
  else
    next_n = n + 1
    until featured_num?(next_n)
      next_n += 1
    end
    next_n
  end
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements
