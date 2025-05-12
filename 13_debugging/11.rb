=begin
What's wrong with the output?

Josh wants to print an array of numeric strings in reverse numerical order.
However, the output is wrong. Without removing any code, help Josh get the
expected output.
=end

=begin
arr = ["9", "8", "7", "10", "11"]
p arr.sort do |x, y|
    y.to_i <=> x.to_i
  end
=end

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]

=begin
The issue in the faulty code is caused by Ruby's order precedence. The block of
sort has a lower precedence than p. Therefore, p arr.sort is executed before
the block gets a chance to be passed to sort. To fix the issue, add a pair of
parentheses around arr.sort and its block.
=end

# Fix
arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|
    y.to_i <=> x.to_i
  end)
