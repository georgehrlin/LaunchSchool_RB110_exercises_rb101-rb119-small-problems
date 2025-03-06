=begin
Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3
entries: one represents the number of characters in the string that are
lowercase letters, one represents the number of characters that are uppercase
letters, and one represents the number of characters that are neither.

Examples:
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
=end

=begin
PEDAC
P
Input:
- A str
Output:
- A hsh of 3 key-value pairs
  - key: :lowercase, val: number of lowercase char in input str
  - key: :uppercase, val: number of uppercase char in input str
  - key: :neither, val: number of char that are neither lowercase nor uppercase

E
letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

D
Input: A str
Output:
- A hsh
  - 3 pairs
    - sym as key
    - int as val

A
- Initialize a result hsh with the needed key-value pairs but val of 0
- Iterate over each char in input str
  - IF char is lowercase
    - Increment corresponding k-v pair's v by 1
  - ELSIF char is uppercase
    - Increment corresponding k-v pair's v by 1
  - ELSE
    - Increment corresponding k-v pair's v by 1
- Return result hsh
=end

def letter_case_count(str)
  result = { lowercase: 0, uppercase:0, neither: 0 }
  str.each_char do |char|
    if ('a'..'z').include?(char)
      result[:lowercase] += 1
    elsif ('A'..'Z').include?(char)
      result[:uppercase] += 1
    else
      result[:neither] += 1
    end
  end

  result
end

# OFFICIAL SOLUTION
def letter_case_count(string)
  counts = {}
  characters = string.chars
  counts[:lowercase] = characters.count { |char| char =~ /[a-z]/ }
  counts[:uppercase] = characters.count { |char| char =~ /[A-Z]/ }
  counts[:neither] = characters.count { |char| char =~ /[^A-Za-z]/ }
  counts
end
