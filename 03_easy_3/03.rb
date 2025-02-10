=begin
Multiplying Two Numbers

Create a method that takes two arguments, multiplies them together, and returns
the result.

Example:
multiply(5, 3) == 15
=end

=begin
PEDAC
P
Input:
- Two integers
Output:
- An integer that is the product of the two input integers

E
multiply(5, 3) # => 15

D
Input:
- Two integers
Output:
- An integer

A
- Define a method, multiply, with two parameters
- Return product of two arguments of multiply
=end

def multiply(num1, num2)
  num1 * num2
end

p multiply(5, 3) == 15

=begin
FURTHER EXPLORATION
Q: For fun: what happens if the first argument is an Array? What do you think
is happening here?

A: I don't remember what is returned when * is called on an array with an
integer as argument. Without looking it up, I'd guess that that would return a
new array with the number of its original elements multiplied by the argument 
integer.
=end

p ['a', :b, ['c']] * 3
# => ['a', :b, ['c'], 'a', :b, ['c'], 'a', :b, ['c']]

=begin
RUBY DOCS
When non-negative argument Integer n is given, returns a new Array built by
concatenating the n copies of self.
When String argument string_separator is given, equivalent to
array.join(string_separator).
=end
