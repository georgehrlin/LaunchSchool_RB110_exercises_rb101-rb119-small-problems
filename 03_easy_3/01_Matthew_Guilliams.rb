OPERATORS = %i[+ - * / % **]

puts '==> Enter the first number:'
num1 = gets.to_i

puts '==> Enter the second number:'
num2 = gets.to_i

OPERATORS.each do |operation|
  result = [num1, num2].inject(operation)
  puts "#{num1} #{operation} #{num2} = #{result}"
end
