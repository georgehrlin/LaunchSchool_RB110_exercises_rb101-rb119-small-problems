=begin
Madlibs Revisited

Make a madlibs program that reads in some text from a text file that you have
created, and then plugs in a selection of randomized nouns, verbs, adjectives,
and adverbs into that text and prints it. You can build your lists of nouns,
verbs, adjectives, and adverbs directly into your program, but the text data
should come from a file or other external source. Your program should read this
text, and for each line, it should place random words of the appropriate types
into the text, and print the result.
=end

adjectives = ['quick', 'lazy', 'sleepy', 'ugly']
nouns =  ['fox', 'dog', 'head', 'leg']
verbs =  ['jumps', 'lifts', 'bites', 'licks']
adverbs =  ['easily', 'lazily', 'noisily', 'excitedly']

=begin
# Original attempt
replacement_words = {
  adjective: adjectives.sample,
  noun: nouns.sample,
  verb: verbs.sample,
  adverb: adverbs.sample
}

text = File.read('example.txt')
puts sprintf(text, replacement_words)
=end

=begin
# Attempt after reading LSBot's code review
File.open('example.txt') do |file|
  file.each_line do |line|
    puts format(line, { 
                  adjective: adjectives.sample,
                  noun: nouns.sample,
                  verb: verbs.sample,
                  adverb: adverbs.sample
                  })
  end
end
=end

# Official Solution
ADJECTIVES = %w(quick lazy sleepy ugly).freeze
NOUNS      = %w(fox dog head leg cat tail).freeze
VERBS      = %w(spins bites licks hurdles).freeze
ADVERSB    = %w(easily lazily noisly excitedly).freeze

File.open('example.txt') do |file|
  file.each do |line|
    puts format(line, noun: NOUNS.sample,
                      verb: VERBS.sample,
                      adjective: ADJECTIVES.sample,
                      adverb: ADVERBS.sample)
  end
end
