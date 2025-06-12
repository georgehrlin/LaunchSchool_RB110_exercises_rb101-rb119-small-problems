=begin
def word_sizes(str)
  result = {}
  words = str.split

  words.each do |word|
    if result.key?(word.size)
      result[word.size] += 1
    else
      result[word.size] = 1
    end
  end

  result
end
=end

# OFFICIAL SOLUTION
=begin
def word_sizes(str)
  result = Hash.new(0)
  words.split.each { |word| result[word.size] += 1 }

  result
end
=end

=begin
Using result = Hash.new(0) instead of result = {} sets 0 as the default value
for each key-value pair. (Default value is the value returned when the key is
not found.) Therefore, result[word.size] references 0 even if the key-value
pair has not been explicitly initialized yet.
=end


# Improved version
=begin
def word_sizes(str)
  str.split.each_with_object(Hash.new(0)) { |word, hsh| hsh[word.size] += 1}
end
=end

# Inspired by Patrick Moran
# Using Enumerable#tally
=begin
def word_sizes(str)
  str.split.map { |word| word.size }.tally
end
=end

# Jason Wang
def word_sizes(str)
  str.split
     .group_by(&:size)
     .map { |k, v| [k, v.size]}
    .to_h
end

p word_sizes('Four score and seven.') # == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') # == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") # == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') # == {}
