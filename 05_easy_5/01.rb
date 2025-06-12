=begin
ASCII String Value

Write a method that determines and returns the ASCII string value of a string
that is passed in as an argument. The ASCII string value is the sum of the
ASCII values of every character in the string. (You may use String#ord to
determine the ASCII value of a character.)
=end

=begin
PEDAC
P
Input:
- A string that can consist of any characters
Output:
- The ASCII string value of the input string
  - The ASCII string value is the sum of the ASCII values of every character in
    the string
Hint:
- Use String#ord to determine the ASCII value of a character

E
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

D
Input: A string
Output: An integer

A
ord → integer
Returns the integer ordinal of the first character of self

General:
- Because String#ord only returns the integer ordinal of the first character
  of the string on which the method is called, the first character then needs
  to be removed after ord is called
  - String#shift is useful here
    - NEVER MIND there is no such built-in method

- Initialize a var, ascii_sum, that points to 0 to collect ASCII values
- Until input string is empty
  - Remove first character and call ord on the return value
=end

=begin
def ascii_value(str)
  ascii_sum = 0
  idx = 0
  loop do
    ascii_sum += str[idx].ord rescue break
    idx += 1
    break if idx >= str.size
  end

  ascii_sum
end

# Improve: str.size.times do |idx| instead of managing idx manually
=end

def ascii_value(str)
  ascii_sum = 0
  str.size.times do |idx|
    ascii_sum += str[idx].ord
  end

  ascii_sum
end

=begin
def ascii_value(str)
  ascii_sum = 0
  str.each_char { |char| ascii_sum += char.ord }
  ascii_sum
end
=end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0

=begin
# By Mitch Mills
def ascii_value(string)
  string.sum
end
=end

=begin
FURTHER EXPLORATION
There is an Integer method such that:
char.ord.mystery == char
where mystery is our mystery method. Can you determine what method name should
be used in place of mystery? What happens if you try this with a longer string
instead of a single character?
=end

# A: I don't know such method off the top of my head. I will look it up.

=begin
chr → string
chr(encoding) → string
Returns a 1-character string containing the character represented by the value
of self, according to the given encoding.
=end

p 'Four score'.ord.chr    # => "F"
p 'Launch School'.ord.chr # => "L"

# Trying this with a longer string returns a one-character string of the first
# character of the string. This is because String#ord only returns the integer
# ordinal of the first character of the string.
