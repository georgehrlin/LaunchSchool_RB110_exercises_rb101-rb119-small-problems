numbers = []

%w(1st 2nd 3rd 4th 5th last).each do |ordinal|
  print "==> Enter the #{ordinal} number:"
  numbers.push(gets.to_i)
end

last = numbers.pop
appear = numbers.include?(last) ? 'appears' : 'does not appear'
puts "The number #{last} #{appear} in #{numbers}."
