ALPHABET = ('a'..'z').to_a

text = File.read('01_0.txt')

# Improved solution to the main question
def output_largest_sentence_and_size(text)
  sentences = {}

  word_counter = 0
  sentence = []

  text.split.each do |word|
    if word.chars.last == '"' && ['.', '!', '?'].include?(word.chars[-2])
      word_counter += 1
      sentence << word
      sentences[word_counter] = sentence.join(' ')
      word_counter = 0
      sentence = []
    elsif ['.', '!', '?'].include?(word.chars.last)
      word_counter += 1
      sentence << word
      sentences[word_counter] = sentence.join(' ')
      word_counter = 0
      sentence = []
    else
      word_counter += 1
      sentence << word
    end
  end

  largest_sentence = sentences[sentences.keys.max]

  puts "#{largest_sentence}"
  puts "Containing #{sentences.keys.max} words"
end

=begin
FURTHER EXPLORATION

Q1: You may have noticed that our solution fails to print the period at the end
of the sentence. Can you write a solution that keeps the period printed at the
end of each sentence?

A: My solution above already meets this requirement.
=end

=begin
Q2: What about finding the longest paragraph or longest word? How would we go
about solving that problem?
=end

def output_longest_paragraph(text)
  longest_paragraph =
    text.split("\n\n").max_by { |paragraph|paragraph.split.size }

  puts "#{longest_paragraph}"
end

def output_longest_word(text)
  words = text.split
  words.each do |word|
    #puts "word is #{word} and word[0] is #{word[0]}"
    #puts "Is the first char alphabetic? #{ALPHABET.include?(word[0].downcase)}"
    next if !ALPHABET.include?(word[0].downcase) &&
            !ALPHABET.include?(word[-1].downcase) &&
            word.size == 2
    until ALPHABET.include?(word[0].downcase) &&
          ALPHABET.include?(word[-1].downcase)
      word = word[1..-1] if !ALPHABET.include?(word[0])
      word = word[0..-2] if !ALPHABET.include?(word[-1])
    end
  end

  words_by_sizes = 
    words.each_with_object({}) do |word, hsh|
      if hsh.key?(word.size)
        hsh[word.size] << word
      else
        hsh[word.size] = [word]
      end
    end

  longest_word_size = words_by_sizes.keys.max

  puts "#{words_by_sizes[longest_word_size]}"
end

# Suggested by LSBot
def output_longest_word(text)
  clean_words = text.gsub(/[^a-zA-Z\s]/, '').split
  longest_word = clean_words.max_by { |word| word.length }
  puts longest_word
end
