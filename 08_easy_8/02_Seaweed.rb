def leading_substrings(string)
  Array.new(string.size) { |idx| string[0..idx] }
end

p leading_substrings('abc') # == ['a', 'ab', 'abc']
p leading_substrings('a') # == ['a']
p leading_substrings('xyzzy') # == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
