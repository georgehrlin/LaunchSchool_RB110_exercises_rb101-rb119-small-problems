=begin
Word to Digit

Write a method that takes a sentence string as input, and returns the same
string with any sequence of the words 'zero', 'one', 'two', 'three', 'four',
'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

word_to_digit('Please call me at five five five one two three four. Thanks.')
# => 'Please call me at 5 5 5 1 2 3 4. Thanks.'
=end

=begin
PEDAC
P
Input:
- A str that is a sentence
Output:
- The same input str but with quantity words replaced with numbers

E
word_to_digit('Please call me at five five five one two three four. Thanks.')
# => 'Please call me at 5 5 5 1 2 3 4. Thanks.'

D
Input: A str
Output: A str

A
  - Construct a hsh that maps number words with numbers

- If method is destructive
  - Use a destructive method to replace quantity word substrs with number strs

- If method is not destructive and returns a new string
  - Split input str into an arr of word strs
  - Construct a new str by iterating over arr of word strs
    - Replace each quantity word str with corresponding number str
=end

QUANTITY_TO_DIGIT = { 'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3,
                         'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7,
                         'eight' => 8, 'nine' => 9 }

QUANTITIES = ['zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven',
              'eight', 'nine']

=begin
# If word_to_digit is destructive and mutates the argument str
def word_to_digit!(str)
  str.gsub!('zero', QUANTITY_TO_DIGIT)
  str.gsub!('one', QUANTITY_TO_DIGIT)
  str.gsub!('two', QUANTITY_TO_DIGIT)
  str.gsub!('three', QUANTITY_TO_DIGIT)
  str.gsub!('four', QUANTITY_TO_DIGIT)
  str.gsub!('five', QUANTITY_TO_DIGIT)
  str.gsub!('six', QUANTITY_TO_DIGIT)
  str.gsub!('seven', QUANTITY_TO_DIGIT)
  str.gsub!('eight', QUANTITY_TO_DIGIT)
  str.gsub!('nine', QUANTITY_TO_DIGIT)
end

str = 'Please call me at five five five one two three four. Thanks.'
word_to_digit!(str)
p str
=end

=begin
# If word_to_digit is not destructive and returns a new str
def word_to_digit(str)
  str.split.each do |word|
    QUANTITIES.each do |quantity|
      if word.include?(quantity)
        word.sub!(quantity, QUANTITY_TO_DIGIT)
      end
    end
  end
  .join(' ')
end
=end

# OFFICIAL SOLUTION
def word_to_digit(str)
  QUANTITY_TO_DIGIT.each_key do |quantity|
    str.gsub!(/\b#{quantity}\b/, QUANTITY_TO_DIGIT)
  end
  str
end

str = 'Please call me at five five five one two three four. Thanks.'
word_to_digit(str)
p str
