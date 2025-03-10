=begin
Staggered Caps (Part 1)

Write a method that takes a String as an argument, and returns a new String
that contains the original value using a staggered capitalization scheme in
which every other character is capitalized, and the remaining characters are
lowercase. Characters that are not letters should not be changed, but count as
characters when switching between upper and lowercase.

Examples:
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A new str with same val but using a staggered capitalization format
  - Every other char is upcase
  - Non-letter char counts when switching between char

E
staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
staggered_case('ALL_CAPS') == 'AlL_CaPs'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

D
Input: A str
Intermediate: An arr of str
Output: A str

A
General
- Upcase first char, then downcase the next, then upcase the next, etc.
- Upcase char at odd indices, downcase char at even indices

- Initialize an empty str to collect result
- Iterate over input str with index
  - IF char at even index
    - Upcase it and append to result str
  - ELSIF char at odd index
    - Downcase it and append it to result str
- Return result string
=end

def staggered_case(str)
  result = ''
  str.each_char.with_index do |char, idx|
    result << (idx.even? ? char.upcase : char.downcase)
  end

  result
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'

# OFFICIAL SOLUTION
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper
      result += char.upcase
    else
      result += char.downcase
    end
    need_upper = !need_upper
  end

  result
end
