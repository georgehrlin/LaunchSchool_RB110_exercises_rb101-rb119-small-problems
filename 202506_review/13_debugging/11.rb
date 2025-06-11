arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
  y.to_i <=> x.to_i
end)

# My guess of expected output: ["11", "10", "9", "8", "7"] # CORRECT
# My guess of original code output: ["9", "8", "7", "11", "10"] # WRONG

# Actual origial code output: ["10", "11", "7", "8", "9"]


=begin
I am not so sure why the original code outputs the way it does, so I look up
Ruby Docs 3.2:

Array#sort
sort → new_array
With a block, calls the block with each element pair; for each element pair a
and b, the block should return an integer:
- Negative when b is to follow a.
- Zero when a and b are equivalent.
- Positive when a is to follow b.

Integer#<=>
self <=> other → -1, 0, +1, or nil
Returns:
- -1, if self is less than other.
- 0, if self is equal to other.
- 1, if self is greater than other.
- nil, if self and other are incompatible.
=end

=begin
x => "9", y => "8"
8 <=> 9 => -1 Negative, so b (y) is to follow a (x)
["9", "8"]

x => "10", y => "11"
11 <=> 10 => 1 Positive, so a (x) is to follow b (y)
["11", "10"]

"9" should come before "8", and "11" should come before "10" if sort is working
properly with its block.
=end

=begin
I tested arr.sort without the block and I got the same output. sort is likely
called without the block despite how it is phrased.
=end
