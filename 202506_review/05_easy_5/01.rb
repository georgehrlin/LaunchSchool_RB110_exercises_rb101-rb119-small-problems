=begin
def ascii_value(str)
  str.chars.reduce(0) { |sum, char| sum += char.ord }
end

# Improve
def ascii_value(str)
  str.chars.reduce(0) { |sum, char| sum + char.ord }
end
=end

def ascii_value(str)
  ascii_sum = 0
  str.size.times do |idx|
    ascii_sum += str[idx].ord
  end

  ascii_sum
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# FURTHER EXPLORATION

# The mystery method is Integer#chr
p 'A'.ord.chr # => "A"

# Trying #chr with a longer string
p 'abc'.ord.chr # => "a"
# Because #ord only returns the ordinal of the first character in a longer
# string, #chr only returns the first character in this example
