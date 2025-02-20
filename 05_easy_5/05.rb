=begin
Clean up the words

Given a string that consists of some words (all lowercased) and an assortment
of non-alphabetic characters, write a method that returns that string with all
of the non-alphabetic characters replaced by spaces. If one or more
non-alphabetic characters occur in a row, you should only have one space in the
result (the result should never have consecutive spaces).
=end

=begin
PEDAC
P
Input:
- A string consists of lowercase words and non-alphabetic characters
Output:
- A string with all of the non-alphabetic characters in the input string
  replaced by spaces
  - And if one or more non-alphabetic characters occur in a row, they are
    condensed into one space instead of many

E
cleanup("---what's my +*& line?") == ' what s my line '

D
Input: A string
Output: A string

A
Potential Solution 1
- Use a method (like String#gsub) to replace all non-alphabetic characters with
  spaces
- Condense consecutive multiple spaces into one

Potential Solution 2
- Split input string into an array of characters
- Iterate over array
  - Substitute character with space if it is non-alphabetic
- Condense consecutive multiple spaces into one
- Convert the array into a string

Sub Problem:
Condense consecutive multiple spaces into one
- With an array of characters
- Iterate over the array using index
  - Start a nested loop that begins with the second element
  - IF the second element is the same as the first
    - Remove the second element from array
  - ELSE
    - Break the nested loop so the outer loop can continue on to the next
      element
=end

def condense_consecutive_spaces(arr)
  arr.each_with_index do |char, idx|
    loop do
      if char == ' ' && arr[idx + 1] == ' '
        arr.delete_at(idx + 1)
      else
        break
      end
    end
  end
end

def cleanup(str)
  arr = str.split('').map do |char|
    if ('a'..'z').include?(char)
      char
    else
      ' '
    end
  end

  condense_consecutive_spaces(arr).join
end

# p condense_consecutive_spaces([" ", " ", " ", "w", "h", "a", "t", " ", "s", " ", "m", "y", " ", " ", " ", " ", " ", "l", "i", "n", "e", " "])

p cleanup("---what's my +*& line?") == ' what s my line '
