def substrings(str)
  result = []
  str.chars.each_index do |idx|
    (str.size - idx).times do |n|
      result << str[idx..(idx + n)]
    end
  end

  result
end

def palindromic?(str, ignore_nonalphanumeric=true, ignore_case=true)
  str = str.gsub(/\W/,'') if ignore_nonalphanumeric
  str = str.downcase if ignore_case
  str.length > 1 && str == str.reverse
end

def palindromes(str)
  substrings(str).select { |substring| palindromic?(substring) }
end

p palindromes('m-aD-Am')
