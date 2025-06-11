=begin
Getting Things Done

We wrote a method for moving a given number of elements from one array to
another. We decide to test it on our todo list, but invoking move on line 11
results in a SystemStackError. What does this error mean and why does it
happen?
=end

=begin
def move(n, from_array, to_array)
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']
=end

=begin
Without running the faulty code and looking at Hint, I think that it results in
a SystemStackError because of how the method move is defined. There are two
main problems with the method move:
1. The intention of having the parameter n in move is to indicate the number of
leading elements to be moved from the first array to the second. However, the
current implementation of move fails to use n at all in its definition.
2. move lacks a stopping condition for its recursion. As of now, once move is
called, it will keep calling itself inifinitely, overflowing the call stack and
leading to a SystemStackError.
=end

=begin
ADDENDUM

It is not entirely correct to say that "move fails to use n at all in its
definition."
=end

# Fix
def move(n, from_array, to_array)
  to_array << from_array.shift
  n -=1
  move(n, from_array, to_array) unless n == 0
end

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

# OFFICIAL SOLUTION
def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

todo = ['coffee with Tom', 'do laundry']
done = ['apply sunscreen', 'go to the beach']

move(4, todo, done)

p todo # should be: ['coffee with Tom']
p done # should be: ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin
FURTHER EXPLORATION

Q: What happens if the length of the from_array is smaller than n?

A: A (n - number of elements of from_array) number of nil will be appended to
   to_array.
=end
