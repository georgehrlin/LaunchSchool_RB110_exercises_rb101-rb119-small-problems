WORDS_TO_DIGITS = { 'one'   => '1',
                    'two'   => '2',
                    'three' => '3',
                    'four'  => '4',
                    'five'  => '5',
                    'six'   => '6',
                    'seven' => '7',
                    'eight' => '8',
                    'nine'  => '9' }

=begin
# Without looking at Hints
def word_to_digit(sentence)
  sentence.gsub!('one',   WORDS_TO_DIGITS)
  sentence.gsub!('two',   WORDS_TO_DIGITS)
  sentence.gsub!('three', WORDS_TO_DIGITS)
  sentence.gsub!('four',  WORDS_TO_DIGITS)
  sentence.gsub!('five',  WORDS_TO_DIGITS)
  sentence.gsub!('six',   WORDS_TO_DIGITS)
  sentence.gsub!('seven', WORDS_TO_DIGITS)
  sentence.gsub!('eight', WORDS_TO_DIGITS)
  sentence.gsub!('nine',  WORDS_TO_DIGITS)
  sentence
end
=end

# After looking at both Hints
def word_to_digit(sentence)
  WORDS_TO_DIGITS.each_key do |key|
    sentence.gsub!(/\b#{key}\b/, WORDS_TO_DIGITS)
  end
  sentence
end

=begin
# After LSBot's code reivew
def word_to_digit(sentence)
  WORDS_TO_DIGITS.each_key do |key|
    sentence.gsub!(key, WORDS_TO_DIGITS)
  end
  sentence
end
=end

str = 'Please call me at five five five one two three four. Thanks.'
p word_to_digit(str)
