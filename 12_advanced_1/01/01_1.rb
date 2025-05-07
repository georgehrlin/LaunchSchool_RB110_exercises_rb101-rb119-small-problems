# After reading Hint, this is an attempt with #gsub
adjectives = ['quick', 'lazy', 'sleepy', 'ugly']
nouns =  ['fox', 'dog', 'head', 'leg']
verbs =  ['jumps', 'lifts', 'bites', 'licks']
adverbs =  ['easily', 'lazily', 'noisily', 'excitedly']

text = File.read('example.txt')
lines = text.split("\n")

lines.each do |line|
  line.gsub!('%{adjective}', adjectives.sample)
  line.gsub!('%{noun}', nouns.sample)
  line.gsub!('%{verb}', verbs.sample)
  line.gsub!('%{adverb}', adverbs.sample)
  puts line
end

# LSBot suggestion
replacements = {
  '%{adjective}' => adjectives,
  '%{noun}' => nouns,
  '%{verb}' => verbs,
  '%{adverb}' => adverbs
}

lines.each do |line|
  replacements.each do |placeholder, words|
    line.gsub!(placeholder, words.sample)
  end
  puts line
end
