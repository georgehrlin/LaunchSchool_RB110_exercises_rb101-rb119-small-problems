def fibonacci(nth)
  return 0 if nth == 0
  return 1 if nth == 1
  fibonacci(nth - 2) + fibonacci(nth - 1)
end

p fibonacci(0)
# p fibonacci(1) == 1
# p fibonacci(2) == 1
# p fibonacci(3) == 2
# p fibonacci(4) == 3
# p fibonacci(5) == 5
# p fibonacci(12) == 144
# p fibonacci(20) == 6765

=begin
Q: Before you move on, take some time to think about our solution (not the tail
recursive solution). Can you identify any faults with it? Not bugs, but
problems that impact its usability. How might you try to repair the issues you
identify? Don't do any coding right now.

A: I believe the usability problem has to do with passing a large nth to the
Official Solution method (though I can be wrong). The number of times fibonacci
calls itself grows exponentially as the nth number increases. For a very large
number, it may take a very long time for a computer with limited computing
power to return the result with this method. (A side note: I don't know if this
is the only usability issue that the question is asking for.)

How might I fix this problem? I'd try keeping recursion but structure the
method differently. Instead of having fibonacci calling itself twice in the
original definition, I'd use a more loop-like structure. My fibonacci method
would iteratively add itself from 1 to the target nth number. In every
iteration, it'd save its sum and pass it on to the next iteration, so, in this
case, the number of times fibonacci is called would only increase lineraly as
nth gets larger.
=end
