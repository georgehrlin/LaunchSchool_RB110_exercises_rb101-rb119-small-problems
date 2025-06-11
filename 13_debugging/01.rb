=begin
Countdown

Our countdown to launch isn't behaving as expected. Why?
Change the code so that our program successfully counts down from 10 to 1.
=end

=begin
def decrease(counter)
  counter -= 1
end

counter = 10

10.times do
  puts counter
  decrease(counter)
end

puts 'LAUNCH!'
=end

=begin
Without running this code to see its output, I believe this code outputs 10
ten times.

The misbehaviour is because line 9 fails to reassign the local variable counter
to 9. Line 9 merely returns a value 9, but it needs to be assigned to counter
again to update the value that counter points to in the loop.
=end

# Fix
def decrease(counter)
  counter -= 1
end

counter = 8

counter.times do # FURTHER EXPLORATION
  puts counter
  counter = decrease(counter)
end

puts 'LAUNCH!'

=begin
ADDENDUM

"The issue of the original code snippet has to do with Ruby's pass-by-value
behaviour for immutable objects like integers. When you pass counter to the
decrease method, you're passing the value, not a reference to the variable
itself."
=end
