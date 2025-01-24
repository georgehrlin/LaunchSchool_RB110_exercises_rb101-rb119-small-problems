=begin
Odd
Write a method that takes one integer argument, which may be positive,
negative, or zero. This method returns true if the number's absolute value is
odd. You may assume that the argument is a valid integer value.

Examples
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

Keep in mind that you're not allowed to use #odd? or #even? in your solution.

PEDAC
P
Input: An integer that could be positive, negative, or zero
Output: A boolean value of whether the input integer's absolute value is odd

Explicit:
- odd? and even? are not allowed

E
puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true

D
Input: An integer
Output: A boolean

A
- Find absolute value of input intger
- Determine if absolute value is odd or not
=end

=begin
def is_odd?(num)
  num.abs % 2 != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
=end

=begin
NOTES
The sign of the reult of modulo operators depends on the number on the right of
the operator.
The sign of the result of remainder operators depends on the number on the left
of the operator.

modulo         |remainder
 5 mod 2  => 1 | 5 rem  2 => 1
-5 mod 2  => 1 |-5 rem  2 => -1
 5 mod -2 => -1| 5 rem -2 => 1
-5 mod -2 => -1|-5 rem -2 => -1

"Remainder left; modulo right."
=end

=begin
FURTHER EXPLORATION
If you weren't certain whether % were the modulo or remainder operator, how
would you rewrite #is_odd? so it worked regardless?

The Integer#remainder method performs a remainder operation in Ruby. Rewrite
#is_odd? to use Integer#remainder instead of %.

A: The purpose of #is_odd? is it "returns true if the number's absolute value
is odd". So long as I convert the input integer to its absolute value before
checking whether it's odd (like in my solution), either the modulo or remainder
operator would work just fine.
=end

def is_odd?(num)
  num.abs.remainder(2) != 0
end

puts is_odd?(2)    # => false
puts is_odd?(5)    # => true
puts is_odd?(-17)  # => true
puts is_odd?(-8)   # => false
puts is_odd?(0)    # => false
puts is_odd?(7)    # => true
