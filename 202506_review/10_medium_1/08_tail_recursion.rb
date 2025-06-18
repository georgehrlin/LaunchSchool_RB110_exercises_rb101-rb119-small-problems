def fibonacci_tail(nth, acc1, acc2)
  if nth == 1
    acc1
  elsif nth == 2
    acc2
  else
    fibonacci_tail(nth - 1, acc2, acc2 + acc1)
  end
end

def fibonacci(nth)
  fibonacci_tail(nth, 1, 1)
end

=begin
Example 1: fibonacci(3)
fibonacci(3, 1, 1)
fibonacci_tail(2, 1, 2) => 2

Example 2: fibonacci(5)
fibonacci(5, 1, 1)
fibonacci_tail(5, 1, 1)
fibonacci_tail(4, 1, 2)
fibonacci_tail(3, 2, 3)
fibonacci_tail(2, 3, 5) => 5
=end
