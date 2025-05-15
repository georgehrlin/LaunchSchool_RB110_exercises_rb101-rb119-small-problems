=begin
PEDAC
P
Input:
- A rational number
Output:
- An arr of ints that represent the denominators of an Etyptian Fraction

E
egyptian(Rational(2, 1)) == [1, 2, 3, 6]
egyptian(Rational(137, 60)) == [1, 2, 3, 4, 5]
egyptian(Rational(3, 1)) == [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 15, 230, 57960]

D
Input: A number
Output: An arr of ints

A
- Initialize a result arr
- Initialize a var, current_sum, that points to 0
- Initialize a var, current_denominator, that points to 1
- UNTIL current_sum is equal to input int
  - IF current_sum + (1 / current_denominator) is larger than input int
    - current_denominator increases by 1
  - ELSE
    - current_sum = current_sum + (1 / current_denominator)
    - Append current_denominator to result
    - current_denominator increases by 1
- Return result
=end

def egyptian(n)
  result = []
  current_sum = 0
  current_denominator = 1

  until current_sum == n
    if (current_sum + (Rational(1, current_denominator))) > n
      current_denominator += 1
      # binding.pry
    else
      current_sum += Rational(1, current_denominator)
      result << current_denominator
      current_denominator += 1
      # binding.pry
    end
  end

  result
end

=begin
PEDAC
P
Input:
- An arr of ints that represent the denominators of an Egyptian Fraction
Output:
- A number that is expressed by the input Egyptian Fraction

E
unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)

D
Input: An arr of ints
Output: A num

A
- Return the sum of the fractions of 1 over each of all the ints in input arr
=end

def unegyptian(arr)
  arr.map { |denominator| Rational(1, denominator) }.sum
end
