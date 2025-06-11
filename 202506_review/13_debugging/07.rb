def neutralize(sentence)
  words = sentence.split(' ')
  words.delete_if { |word| negative?(word) }

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

=begin
Using the example on line 18, the final output still contains 'boring' (a
negative word) because the words array is mutated while it is being iterated.
When the iteration moves on to 'dull', it is deleted because it is a negative
word. Once it is removed, 'boring' takes the place which originally belonged
to 'dull', but the iteration continues, moving on to the next string, which is
now 'cards', skipping 'broing' altogether.
=end

# FURTHER EXPLORATION
def mutating_reject(array)
  i = 0
  loop do
    break if i == array.length

    if yield(array[i]) # if array[i] meets the condition checked by the block
      array.delete_at(i)
    else
      i += 1
    end
  end

  array
end
