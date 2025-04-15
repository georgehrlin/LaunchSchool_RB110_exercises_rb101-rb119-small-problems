=begin
Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number
of uppercase and lowercase characters, as well as characters that were neither
of those two. Now we want to go one step further.

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the percentage of characters in the string that are
lowercase letters, one the percentage of characters that are uppercase letters,
and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A hsh
 - Keys are :lowercase, :uppercase, :neither
 - Vals are floats that are the percentages of each type in the input str

E
letter_percentages('abCdef 123') # => { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') # => { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') # => { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }

D
Input: A str
Output: A hsh with sym as keys and flt as vals

A
- Assign total num of chars of input str to a var
- Initialize three vars that point to 0 that keep track of nums of lowercase,
  uppercase, and neither
- Iterate over chars of input str
  - IF it is a lowercase letter
    - Increase num_lowercase by 1
  - ELSIF it is an uppercase letter
    - Increase num_uppercase by 1
  - ELSE
    - Increase num_neither by 1
- Initialize three vars that point to percentages
- Initialize result hsh using the percentages
=end

=begin
def letter_percentages(str)
  num_total = str.size
  num_lowercase = str.count('a-z')
  num_uppercase = str.count('A-Z')
  num_neither = num_total - num_lowercase - num_uppercase
  percent_lower = num_lowercase.to_f / num_total * 100
  percnet_upper = num_uppercase.to_f / num_total * 100
  percnet_neither = 100 - percent_lower - percnet_upper

  # Further Exploration solution included
  { lowercase: format('%.1f', percent_lower),
    uppercase: format('%.1f', percnet_upper),
    neither:   format('%.1f', percnet_neither) }
end
=end

def letter_percentages(str)
  percent_lower = str.count('a-z').to_f / str.size * 100
  percent_upper = str.count('A-Z').to_f / str.size * 100
  percent_neither = str.count('^A-Za-z').to_f / str.size * 100

  # { lowercase: percent_lower.round(1),
  #   uppercase: percent_upper.round(1),
  #   neither: percent_neither.round(1) }
  
  { lowercase: format('%1f', percent_lower),
    uppercase: format('%1f', percent_upper),
    neither: format('%1f', percent_neither) }
end

p letter_percentages('abCdef 123') # => { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') # => { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') # => { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
p letter_percentages('abcdefGHI')
