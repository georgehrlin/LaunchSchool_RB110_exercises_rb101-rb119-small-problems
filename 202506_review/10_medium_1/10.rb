require 'benchmark'

=begin
# My attempt of a procedural version
def fibonacci(nth)
  if [1, 2].include?(nth)
    1
  else
    fi = [1, 1]
    (nth - 2).times do
      fi << fi[-2] + fi.last
    end
  end

  fi.last
end
=end

# Official and better procedural version
def fibonacci(nth)
  first, last = [1, 1]
  3.upto(nth) do
    first, last = [last, first + last]
  end

  last
end


def fibonacci_last_1(nth)
  fibonacci(nth).to_s[-1].to_i
end

def fibonacci_last_2(nth)
  fibonacci(nth).digits.first
end

def fibonacci_last_3(nth)
  first, last = [1, 1]
  3.upto(nth - 1) do
    first, last = [last, first + last]
  end

  first.digits.first.to_i + last.digits.first.to_i
end

# fibonacci_last(15)        # -> 0  (the 15th Fibonacci number is 610)
# fibonacci_last(20)        # -> 5 (the 20th Fibonacci number is 6765)
# fibonacci_last(100)       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
# fibonacci_last(100_001)   # -> 1 (this is a 20899 digit number)
# fibonacci_last(1_000_007) # -> 3 (this is a 208989 digit number)
# fibonacci_last(123456789) # -> 4

# Benchmark.bm do |x|
#   x.report('fibonacci_last_1') {fibonacci_last_1(1_000_007)}
#   x.report('fibonacci_last_2') {fibonacci_last_2(1_000_007)}
#   x.report('fibonacci_last_3') {fibonacci_last_3(1_000_007)}
# end

p fibonacci_last_1(100)
p fibonacci_last_2(100)
p fibonacci_last_3(100)
