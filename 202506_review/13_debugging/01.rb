=begin
# FIX
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
=end

=begin
The original buggy code outputs:
10
10
10
10
10
10
10
10
10
10
LAUNCH!
=end

# FURTHER EXPLORATION
def decrease(counter)
  counter -= 1
end

counter = 10

until counter == 0
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'
