=begin
PEDAC
P
Input: A str, potentially with consecutive, repeating chars
Output: Input str but with all the consecutive redundnat chars removed

E
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

D
Input: A str
Intermediary: An arr, potentially
Output: A str

A
- Initialize an empty result str
- Iterate over input str with idx
  - Append char to result if char != last char of result str
- Return result str
=end

=begin
def crunch(str)
  result = ''
  str.split('').each { |char| result << char if result[-1] != char }

  result
end
=end

=begin
FURTHER EXPLORATION

Q1: You may have noticed that we continue iterating until index points past the
end of the string. As a result, on the last iteration text[index] is the last
character in text, while text[index + 1] is nil. Why do we do this? What 
happens if we stop iterating when index is equal to text.length?
=end

=begin
A: For insntace, with an argument string consisting of only repeating
characters (like "aaa"), comparing the last character in the text to nil is
necessary to ensure that one of the repeating characters gets added to the
result. If the iteration stops when index is equal to text.length, an empty
string will be returned with an argument string like "aaa".
=end

=begin
Q2: Can you determine why we didn't use String#each_char or String#chars to
iterate through the string? How would you update this method to use
String#each_char or String#chars?
=end

=begin
A: String#each_char and String#chars were not used because two characters must
be referenced and compared in each iteration. Also, the official solution uses
an incrementing index by setting it manually, so there is really no need to use
either of those two methods.
=end

# Using String#each_char
=begin
def crunch(str)
  str.each_char.with_index.with_object('') do |(char, idx), result|
    result << char unless char == str[idx + 1]
  end
end
=end

# Using String#chars
def crunch(str)
  str.chars.each_with_index.with_object('') do |(char, idx), result|
    result << char unless char == str[idx + 1]
  end
end
