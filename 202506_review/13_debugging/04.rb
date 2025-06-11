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

=begin
The buggy original code raises an error because, on line 7, words[i] is a
string whereas reversed_words is an array, and a string cannot be concatenated
with an array.
=end
