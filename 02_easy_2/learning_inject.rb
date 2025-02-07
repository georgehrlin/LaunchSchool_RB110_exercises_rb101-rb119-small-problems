=begin
inject(symbol) → object
inject(initial_operand, symbol) → object
inject {|memo, operand| ...} → object
inject(initial_operand) {|memo, operand| ...} → object

Returns an object formed from operands via either:
- A method named by symbol.
- A block to which each operand is passed.
=end

# With method-name argument symbol, combines operands using the method:
(1..4).inject(:+)     # => 10
(1..4).inject(10, :+) # => 20

# With a block, passes each operand to the block:
(1..4).inject { |sum, n| sum + n*n }    # => 30
# 1 + 4 + 9 + 16 = 30
(1..4).inject(2) { |sum, n| sum + n*n } # => 32
# 2 + 1 + 4 + 9 + 16 = 32

=begin
Operands
If argument initial_operand is not given, the operands for inject are simply
the elements of self.
Example calls and their operands:
(1..4).inject(:+)      [1, 2, 3, 4]
(1...4).inject(:+)     [1, 2, 3]
('a'..'d').inject(:+)  ['a', 'b', 'c', 'd']
('a'...'d').inject(:+) ['a', 'b', 'c']
=end

# Examples with initial_operand of various types:
(1..4).inject(2, :+)          # => 12
(1..4).inject(2.0, :+)        # => 12.0
('a'..'d').inject('foo', :+)  # => "fooabcd"
%w[a b c].inject(['x'], push) # => ["x", "a", "b", "c"]

=begin
Combination by Given Method
If the method-name argument symbol is given, the operands are combined by that
method:
- The first and second operands are combined.
- That result is combined with the thrid operand.
- That result is combined with the fourth operand.
- And so on.
The return value from inject is the result of the last combination.
=end

# Examples with various methods:
(1..4).inject(:+) # => 10
(1..4).inject(:*) # => 24
('a'..'d').inject('', :+) # => "abcd"
%w[foo bar baz].inject('', :+) # => "foobarbaz"
h = [{foo: 0, bar: 1}, {baz: 2}, {bat: 3}].inject(:update)
# => {:foo=>0, :bar=>1, :baz=>2, :bat=>3}
h = {foo: 0, bar: 1}.inject([], :push)
# => ["[foo", 0], ["bar", 1]]

=begin
Combination by Given Block
If a block is given, the operands are passed to the block:
- The first call passes the first and second opearnds.
- The second call passes the result of the first call, along with the third
  operand.
- The third call passes the result of the second call, along with the fourth
  operand.
- And so on.
The return value from inject is the return value from the last block call.
=end

(1..4).inject do |memo, element|
  p "Memo: #{memo}; element: #{element}"
  memo + element
end
# => 10
# Output:
# "Memo: 1; element: 2"
# "Memo: 3; element: 3"
# "Memo: 6; element: 4"
