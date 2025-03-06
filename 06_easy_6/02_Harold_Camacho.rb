def remove_vowels(strings)
  strings.map do { |string| string.gsub(/[aeiou, AEIOU]/, '')}
end
