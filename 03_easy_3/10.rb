=begin
Uppercase Check

Write a method that takes a string argument, and returns true if all of the
alphabetic characters inside the string are uppercase, false otherwise.
Characters that are not alphabetic should be ignored.
=end

=begin
PEDAC
P
Input:
- A string
Output:
- A boolean value of whether all of the alphabetic characters inside the string
  are uppercase, ignoring non-alphabetic characters

E
uppercase?('t') == false
uppercase?('T') == true
uppercase?('Four Score') == false
uppercase?('FOUR SCORE') == true
uppercase?('4SCORE!') == true
uppercase?('') == true

D
Input:
- A string
Output:
- A boolean value

A
General:
- Return a new string with all the non-alphabetic characters in the input
  string removed
- Check if the processed string contains only uppercase alphabetic characters
=end

ALPHABET_UPPER = ('A'..'Z').to_a

def uppercase?(input)
  input.delete('^A-Za-z').chars.all? { |char| ALPHABET_UPPER.include?(char) }
end

p uppercase?('t') == false
p uppercase?('T') == true
p uppercase?('Four Score') == false
p uppercase?('FOUR SCORE') == true
p uppercase?('4SCORE!') == true
p uppercase?('') == true

# OFFICIAL SOLUTION
def uppercase?(string)
  string == string.upcase
end

=begin
FURTHER EXPLORATION

Food for thought: in our examples, we show that uppercase? should return true
if the argument is an empty string. Would it make sense to return false
instead? Why or why not?
=end

=begin
A: It is ultimately a design choice of whether uppercase? should return true or
false when given an empty string as argument. 

It makes sense for uppercase? to return true if the input string is an empty
string, because uppercase? is only concerned with whether all the alphabetic
characters in the input string are uppercase, so it should only return false if
there is at least one character in the input string that is lowercase. If there
is no alphabetic character in the input string, it makes sense for the method
to return true by design.
=end
