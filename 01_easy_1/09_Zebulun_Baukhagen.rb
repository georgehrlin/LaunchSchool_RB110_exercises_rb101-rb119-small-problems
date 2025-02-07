def center_of(string)
  char_array = string.chars
  until char_array.size <= 2
    char_array.pop
    char_array.shift
  end
  char_array.join
end

p center_of('I love Ruby') # => 'e'
p center_of('Launch School') # => ' '
p center_of('Launch') # => 'un'
p center_of('Launchschool') # => 'hs'
p center_of('x') # => 'x'
