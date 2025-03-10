=begin
Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic
characters when determining whether it should uppercase or lowercase each
letter.

The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

Examples:
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A new str with same val as input str but in staggered capitalization format
  - Letters are in the repeating cases of: upper, lower, upper, lower, etc.
  - Non-alphabetic char do not count in toggling between cases

E
staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
staggered_case('ALL CAPS') == 'AlL cApS'
staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

D
Input: A str
Intermediate: An arr of str
Output: A str

A
- Initialize an empty str to collect result
- Initialize a var that points to true as tracker for toggling cases
- Iterate over char of str
  - IF toggl is true AND char is alphabetic
    - Concat uppercase char to result str
    - Flip toggle
  - ELSIF toggl is false AND char is alphabetic
    - Concat lowercase char to result str
    - Flip toggle
  ELSE
    - Concat original char
- Return result str
=end

ALPHABET = 'A'..'z'

def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if need_upper && ALPHABET.include?(char)
      result += char.upcase
      need_upper = !need_upper
    elsif !need_upper && ALPHABET.include?(char)
      result += char.downcase
      need_upper = !need_upper
    else
      result += char
    end
  end

  result
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'

# OFFICIAL SOLUTION
def staggered_case(string)
  result = ''
  need_upper = true
  string.chars.each do |char|
    if char =~ /[a-z]/i # /i is a flag that indicates to ignore case
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    end
    else
      result += char
    end
  result
end
