=begin
Assume you do not have the rotate_rightmost_digits or rotate_array methods. How
would you approach this problem? Would your solution look different?
=end

def max_rotation(num)
  num_digits = num.digits.reverse
  num_digits.size.times do |n|
    num_digits << num_digits.delete_at(n)
  end

  num_digits.join.to_i
end

=begin
Does this 3 part approach make the problem easier to understand or harder?

A: This 3-prat approach makes the problem easier to understand, but if I was
only solving the third question alone, breaking it into three parts and solving
each in order would've made the process more difficult than necessary.

On the other hand, having walked through the three-part approach first made
solving the last question significantly easier.
=end

=begin
There is an edge case in our problem when the number passed in as the argument
has multiple consecutive zeros. Can you create a solution that preserves zeros?
=end

=begin
def max_rotation(num)
  num_digits = num.digits.reverse
  num_digits.size.times do |n|
    num_digits << num_digits.delete_at(n)
  end

  num_digits.join
end
=end
