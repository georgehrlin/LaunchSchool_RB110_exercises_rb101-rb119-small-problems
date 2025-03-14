=begin
Q: Can you modify this method (and/or its predecessors) to ignore
non-alphanumeric characters and case? Alphanumeric characters are alphabetic
characters(upper and lowercase) and digits.
=end

def substrings(str)
  result = []
  str.chars.each_index do |idx|
    (str.size - idx).times do |n|
      result << str[idx..(idx + n)]
    end
  end

  result
end

def palindromes(str)
  p substrings(str)
  substrings(str).select do |substring|
    substring_processed = substring.dup.downcase.delete('^0-9A-z')
    substring_processed == substring_processed.reverse &&
    substring_processed.length > 1
  end
end

p palindromes('m-aD-Am')
p palindromes('m0-aD-A0m')
