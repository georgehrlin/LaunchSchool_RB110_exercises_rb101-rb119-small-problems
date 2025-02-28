=begin
ddaaiillyy ddoouubbllee

Write a method that takes a string argument and returns a new string that 
contains the value of the original string with all consecutive duplicate
characters collapsed into a single character.

You may not use String#squeeze or String#squeeze!.

Examples:
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end

=begin
PEDAC
P
Input:
- A str consists of potentially multiple words with potentially repeating
  consecutive chars
Output:
- A str with all the repeating consecutive words condensed to just one

E
crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''

D
Input: A str
Intermediary: Potentially an arr
Output: A str

A
- Iterate over input str
  - IF char at next index position is the same as char being iterated
    - Delete it from input str
  - ELSIF char at next index position is different
    - Move on to next char
- Return input str
=end
=begin
def crunch(str)
  chars = str.chars
  idx_first = 0
  idx_next = idx_first + 1
  loop do
    break if idx_first >= chars.size - 1
    if chars[idx_first] == chars[idx_next]
      chars.delete_at(idx_next)
    else
      idx_first += 1
      idx_next += 1
    end
  end

  chars.join
end
=end
=begin
# Without converting input str into an array
def crunch(str)
  idx_first = 0
  idx_next = idx_first + 1
  loop do
    break if idx_first >= str.length - 1
    if str[idx_first] == str[idx_next]
      str.slice!(idx_next)
    else
      idx_first += 1
      idx_next += 1
   end
  end

   str
end
=end

# OFFICIAL SOLUTION
def crunch(text)
  index = 0
  crunch_text = ''
  until index == text.length
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
