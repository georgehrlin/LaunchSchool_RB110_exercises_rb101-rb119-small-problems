=begin
Further Exploration
The compute_sum and compute_product methods are simple and should be familiar.
A more Rubyish way of computing sums and products is with the
Enumerable#inject method. #inject is a very useful method, but if you've never
used it before, it can be difficult to understand.

Take some time to read the documentation for #inject. (Note that all Enumerable methods can be used on Array.) Try to explain how it works to yourself.

Try to use #inject in your solution to this problem.
=end
def calculate_sum_1_to_num(num)
  (1..num).inject(:+)
end

def calculate_product_1_to_sum(num)
  (1..num).inject(:*)
end

puts '>> Please enter an integer greater than 0'
num = gets.to_i
puts ">> Enter 's' to compute the sum, 'p' to compute the prouct."
choice = gets.chomp

result = 'The %s of the integers between 1 and %d is %d.'

if choice == 's'
  puts format(result, 'sum', num, calculate_sum_1_to_num(num))
elsif choice == 'p'
  puts format(result, 'product', num, calculate_product_1_to_sum(num))
else
  puts "Invalid choice. Please enter 's' or 'p'."
end
