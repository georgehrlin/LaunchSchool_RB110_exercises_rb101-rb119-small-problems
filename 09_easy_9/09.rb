=begin
Group Anagrams

Given the array...
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams. Anagrams are
words that have the same exact letters in them but in a different order. Your
output should look something like this:
["demo", "dome", "mode"]
["neon", "none"]
#(etc)
=end

=begin
PEDAC
P
Input:
- An arr of strs
Output:
- Print arrs of strs that are groups of anagrams
  - Anagrams are words that have the same exact letters but in a different
    order

E
words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

# Output:
# ["demo", "dome", "mode"]
# ["neon", "none"]
# (etc)

D
Input: An arr of strs
Output: Print arrs

A
- Helper: anagrams?(str1, str2)
  - Convert str1 and str2 into two arrs of individual char strs
  - Sort them
  - Return whether the two arrs are the same

- Initialize an empty result arr
- Iterate over input arr of strs with index
  - Initialize an empty subresult arr
  - Iterate over input arr of strs with index
    - IF two indices are different
      - Append str being iterated to subresult arr if anagram? returns true
  - Append subresult arr to result arr if subresult arr isn't empty
- Print each subresult subarr of result arr
=end

=begin
def anagrams?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def groups_of_anagrams(arr)
  result = []
  arr.each do |str1|
    subresult = []
    arr.each do |str2|
      if anagrams?(str1, str2)
        subresult << str2 if !result.flatten.include?(str2)
      end
    end
  result << subresult if !subresult.empty?
  end

  result.each { |group| p group }
end
=end

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon', 'lol']

# groups_of_anagrams(words)

# OFFICIAL SOLUTION
result = {}

words.each do |word|
  key = word.chars.sort.join
  if result.has_key?(key)
    result[key].push(word)
  else
    result[key] = [word]
  end
end

result.each_value do |val|
  puts "------"
  p val
end
