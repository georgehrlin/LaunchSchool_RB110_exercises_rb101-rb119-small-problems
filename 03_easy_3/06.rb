=begin
Exclusive Or

In this exercise, you will write a method named xor that takes two arguments,
and returns true if exactly one of its arguments is truthy, false otherwise.
Note that we are looking for a boolean result instead of a truthy/falsy value
as returned by || and &&.

Examples:
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?('abc', nil) == true
p xor?(nil, 'abc') == true
p xor?('abc', 'abc') == false
p xor?(nil, nil) == false
=end

=begin
PEDAC
P
Input:
- An expression with a value that contains truthiness
- An expression with a value that contains truthiness
Output:
- A boolean value (true or false)
  - true if and only if one of the input expressions is truthy
  - false if either:
   - both the input expressions are truthy
   - or both of the input expressions are falsey

E
p xor?(5.even?, 4.even?) == true
p xor?(5.odd?, 4.odd?) == true
p xor?(5.odd?, 4.even?) == false
p xor?(5.even?, 4.odd?) == false
p xor?('abc', nil) == true
p xor?(nil, 'abc') == true
p xor?('abc', 'abc') == false
p xor?(nil, nil) == false

D
Input:
- Two expressions of any type so long as their values contain truthiness
Output:
- A boolean value, true/false

A
- IF
  - (expression1 evaluates to true) AND (expression2 evaluates to true)
  - OR
  - (expression1 evaluates to false) AND (expression1 evaluates to false)
  - return false
- ELSIF: 
  - (expression1 evaluates to true) AND (expression2 evaluates to false)
  - OR
  - (expression1 evaluates to false) AND (expression2 evaluates to true)
  - return true
=end

def xor?(exp1, exp2)
  a = !!exp1
  b = !!exp2

  if (a == true && b == true) || (a == false && b == false)
    false
  else
    true
  end
end

# OFFICIAL SOLUTION
def xor?(value1, value2)
  return true if value1 && !value2
  return true if value2 && !value1
  false
end

def xor?(value1, value2)
  !!((value1 && !value2) || (value2 && !value1))
end

=begin
FURTHER EXPLORATION

Can you think of a situation in which a boolean xor method would be useful?
Suppose you were modeling a light at the top of a flight of stairs wired in
such a way that the light can be turned on or off using either the switch at
the bottom of the stairs or the switch at the top of the stairs. This is an xor
configuration, and it can be modeled in Ruby using the xor method. Think of
some additional examples.

|| and && are so-called short circuit operators in that the second operand is
not evaluated if its value is not needed. Does the xor method perform
short-circuit evaluation of its operands? Why or why not? Does short-circuit
evaluation in xor operations even make sense?
=end

=begin
A: A method like xor comes in handy whenever I want to make sure that the
truthiness of two values are different in a conditional. I suppose an imaginary
scenario is when I need to model a bridge via wich only one person can pass
at a time. To return a value that indicates whether someone is passing the
bridge, xor comes in handy because if both arguments are false, then nobody
is passing the bridge and that returns a final value of false; if there are two
people passing the bridge, represented as two true values passed to xor, that
also returns a final value of false bcause only one person is allowed to pass
the bridge at a time.

The xor method does not perform short-circuit evaluation because it has to
check whether the second boolean value is different from the first one. Short-
circuit evluation in xor operations do not make sense.
=end
