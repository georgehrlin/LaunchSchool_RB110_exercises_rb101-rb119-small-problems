=begin
Reverse It (Part 2)

Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters
reversed. Each string will consist of only letters and spaces. Spaces should be
included only when more than one word is present.

Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
=end

=begin
PEDAC
P
Input:
- A str that contains one or more words
Output:
- A new str with words that contain five or more chars reversed

E
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

D
Input: A str
Intermediate: An arr of strs
Output: A str

A
- Split input str into an arr of word strs
- Initialize an empty arr to collect results
- Itereate over arr of word strs
  - IF size of word str is five or more
    - Reverse it, then append it to result arr
  - ELSE
    - Append word str to result arr
- Join result arr into a str and return it
=end

def reverse_words(str)
  str.split.map do |word|
    if word.size >= 5
      word.reverse
    else
      word
    end
  end.join(' ')
end

puts reverse_words('Professional') == "lanoisseforP"
puts reverse_words('Walk around the block') == "Walk dnuora the kcolb"
puts reverse_words('Launch School') == "hcnuaL loohcS"

# By Eric Qian
def reverse_words(str)
  str.split.map { |word| word >= 5 ? word.reverse : word }.join(' ')
end
