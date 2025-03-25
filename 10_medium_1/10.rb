=begin
Fibonacci Numbers (Last Digit)

In the previous exercise, we developed a procedural method for computing the
value of the nth Fibonacci numbers. This method was really fast, computing the
20899 digit 100,001st Fibonacci sequence almost instantly.

In this exercise, you are going to compute a method that returns the last digit
of the nth Fibonacci number.
=end

def fibonacci(nth)
  first, last = [1, 1]
  (nth - 2).times do
    first, last = [last, first + last]
  end
  last
end

=begin
def fibonacci_last(nth)
  fibonacci(nth).digits.first
end
=end

=begin
def fibonacci_last(nth)
  fibonacci(nth) % 10
end
=end

# OFFICIAL SOLUTION
def fibonacci_last(nth)
  last_2_last_digits = [1, 1]
  3.upto(nth) do
    last_2_last_digits = [last_2_last_digits.last,
                     (last_2_last_digits.first + last_2_last_digits.last) % 10]
  end
  last_2_last_digits.last
end

=begin
NOTE

The point (and brilliance) here is to avoid calculating the actual Fibonacci
numbers, and only calculate the evolving last digits.
=end
