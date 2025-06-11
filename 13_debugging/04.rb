=begin
Reverse Sentence

The reverse_sentence method should return a new string with the words of its
argument in reverse order, without using any of Ruby's built-in reverse
methods. However, the code below raises an error. Change it so that it behaves
as expected.
=end

def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = words[i] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
# expected output: 'doing you are how'

=begin
Without running this code, I think it raises an error because of line 7.
words points to an array with string elements, so words[i] returns a string.
reversed_words points to an empty array. The issue is a string cannot be called
with + and an array as the argument.
=end

# Fix
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words = [words[i]] + reversed_words
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')

# Alternatively
def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  i = 0
  while i < words.length
    reversed_words.prepend(words[i])
    i += 1
  end

  reversed_words.join(' ')
end

p reverse_sentence('how are you doing')
