def word_sizes(string)
  string.split.map { |word| word.size }.tally
end
