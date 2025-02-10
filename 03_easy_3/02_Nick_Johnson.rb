num1, num2 = %w[first second].map do |position|
  puts "==> Enter the #{position} number:"
  gets.to_i
end

%w[+ - * / % **].each do |operation|
  puts "#{num1} #{operation} #{num2} = #{eval("#{num1} #{operation} #{num2}")}"
end
