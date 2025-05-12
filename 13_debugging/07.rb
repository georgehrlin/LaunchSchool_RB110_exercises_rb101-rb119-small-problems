=begin
Neutralizer

We wrote a neutralize method that removes negative words from sentences.
However, it fails to remove all of them. What exactly happens?
=end

def neutralize(sentence)
  words = sentence.split(' ')
  words.each do |word|
    words.delete(word) if negative?(word)
  end

  words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.

=begin
The reason that the word boring is not removed is because the iteration of
boring is skpped due to the words array being mutated during the iteration.

Once the input sentence is broken up into an array of individual words on line
2, line 3 begins an iteration over each word of the sentence. When the
iteration moves on to the word dull, it is removed by line 4. Then, because
dull is removed, the rest of the entire array shifts to the left by one index.
When the iteration continues, it moves on to the next word, which is now cards,
skipping the word boring altogether, so boring does not get removed even though
it'd qualify for deletion by line 4.
=end

# Fix
def neutralize(sentence)
  valid_words = []
  words = sentence.split(' ')
  words.each do |word|
    valid_words << word if !negative?(word)
  end

  valid_words.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')

# ChatGPT
def neutralize(sentence)
  sentence.split(' ').reject { |word| negative?(word) }.join(' ')
end
# Or simply use #select

# FURTHER EXPLORATION

# #reject! can be implemented as:
def mutating_reject(arr)
  i = 0
  loop do
    break if i == arr.length

    if yield(arr[i])
      arr.delete_at[i]
    else
      i += 1
    end
  end

  arr
end
