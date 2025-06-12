def move(n, from_array, to_array)
  to_array << from_array.shift
  n -= 1
  move( n, from_array, to_array) if (n > 0 && !from_array.empty?)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(5, todo, done)

p todo # => ['coffee with Tom']
p done # => ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin
The move method uses recursion. It raises a SystemStackError because it lacks
a stopping condition, so it keeps calling itself indefinitely until the call
stack overflows.
=end

# FURTHER EXPLORATION

=begin
When the length of the from_array array is smaller than n, the to_array will be
appended (n - length of from_array) number of nil.
=end
