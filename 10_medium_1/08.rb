=begin
Fibonacci Numbers (Recursion)

Write a recursive method that computes the nth Fibonacci number, where nth is
an argument to the method.

Examples:
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765
=end

=begin
PEDAC
P
Input:
- An int that indicates the target Fibonacci number
Output:
- An int that is the input-int-th Fibonacci number

E
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

D
Input: An int
Output: An int

A
- Use recursion
- By definition, the 1-st Fibonacci number is 1
- By definition, the 2-nd Fibonacci number is 2
- The manth definition of Fibonacci number is f(n-2) + f(n-1) where n > 2
=end

=begin
def fibonacci(nth)
  return 1 if nth == 1
  return 1 if nth == 2
  fibonacci(nth - 2) + fibonacci(nth - 1)
end
=end

# OFFICIAL SOLUTION
def fibonacci(nth)
  return 1 if nth <= 2
  fibonacci(nth - 1) + fibonacci(nth - 2)
end

# OFFICIAL SOLUTION WITH TAIL RECURSION
def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

=begin
FURTHER EXPLORATION

We will revisit Fibonacci numbers in the next exercise, and, in particular, we
will discuss some problems with our recursive solution. Before you move on,
take some time to think about our solution (not the tail recursive solution).
Can you identify any faults with it? Not bugs, but problems that impact its
usability. How might you try to repair the issues you identify? Don't do any
coding right now.
=end

=begin
fibonacci(3) calls fibonacci three times.
fibonacci(4) calls fibonacci five times.
fibonacci(5) calls fibonacci nine times.
fibonacci(6) calls fibonacci fifteen times.
fibonacci(7) calls fibonacci twenty-five times.
fibonacci(8) calls fibonacci fourty-one times.

It seems to me that the number of times fibonacci is called grows exponentially
as n increases. This would result in an issue if fibonacci was passed with a
large number. Ruby would have to call fibonacci repeatedly an enormous number
of times to find the Fibonacci number at a large n, potentially overwhelming
the processing and storage capacity of the computer.

I am not so sure how I might go about solving this issue. The number of
executions of this method in its current form grows exponentially because it
essentially breaks the Fibonacci number we are looking for into a summation of
1s. A better solution would avoid adding an enormous number of 1s when n gets
big.
=end
