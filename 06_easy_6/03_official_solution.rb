require 'benchmark'

def find_fibonacci_index_by_length_official(number_digits)
  first = 1
  second = 1
  index = 2

  loop do
    index += 1
    fibonacci = first + second
    break if fibonacci.to_s.size >= number_digits

    first = second
    second = fibonacci
  end

  index
end

puts Benchmark.measure { find_fibonacci_index_by_length_official(2000) }
