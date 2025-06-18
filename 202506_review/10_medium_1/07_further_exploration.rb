=begin
FURTHER EXPLORATION
Problem 1: Can you change your solution so that the spaces between consecutive
numbers are removed?
=end

WORDS_TO_DIGITS = { 'zero'  => '0',
                    'one'   => '1',
                    'two'   => '2',
                    'three' => '3',
                    'four'  => '4',
                    'five'  => '5',
                    'six'   => '6',
                    'seven' => '7',
                    'eight' => '8',
                    'nine'  => '9' }

# My not-so-elegant solution, but it works
def word_to_digit(sentence)
  WORDS_TO_DIGITS.each_key do |k|
    sentence.gsub!("#{k} ", WORDS_TO_DIGITS[k])
    sentence.gsub!(k, WORDS_TO_DIGITS[k])
  end
  sentence
end

=begin
There is likely a way to solve this with Regex, a way that specifies the
inclusion of a space that follows next for replacement, but I have not
learned Regex yet
=end

=begin
Problem 2: Suppose the string already contains two or more space separated
numbers (not words); can you leave those spaces alone, while removing any
spaces between numbers that you create?

A: It seems that my not-so-elegant solution above already satisfies what is
asked in this question.
=end

=begin
Problem 3: What about dealing with phone numbers? Is there any easy way to
format the result to account for phone numbers? For our purposes, assume that
any 10 digit number is a phone number, and that the proper format should be
"(123) 456-7890".
=end

=begin
Algorithm:
- Use word_to_digit to transform all number words to digits first
- Replace the substring with ten consecutive digits in sentence string with the
  correctly formatted phone-number substring
    - Initialize an empty array to collect consecutive digits
    - Initialize a counter to keep track of number of consecutive digits
    - Initialize a variable to keep track of the index of starting digit
    - Initialize a variable to keep track of the index of ending digit
    - Iterate over each character of sentence string with index
      - Counter increments by 1 if iterated character is a digit
        - Store index of startin digit if counter is 1
        - Otherwise, counter resets back to 0
      - When counter is 10
        - Format a phone-number substring using the array of consecutive digits
          (HELPER METHOD)
        - Replace substring with phone-number substring using starting and
          ending indices
=end

def format_phone_number(n)
  '(' + n[0] + n[1] + n[2] + ') ' +
  n[3] + n[4] + n[5] + '-' +
  n[6] + n[7] + n[8] + n[9]
end

def word_to_phone_number(sentence)
  arr_consecutive_digits = []
  counter_consecutive_digits = 0
  index_starting = nil
  index_ending = nil

  sentence.chars.each_with_index do |char, i|
    if char.to_i.to_s == char
      counter_consecutive_digits += 1
      arr_consecutive_digits << char
      index_starting = i if counter_consecutive_digits == 1
      index_ending = i if counter_consecutive_digits == 10
    else
      counter_consecutive_digits = 0
      arr_consecutive_digits.clear
    end

    if counter_consecutive_digits == 10
      str_phone_number = format_phone_number(arr_consecutive_digits)
      sentence[index_starting..index_ending] = str_phone_number
    end
  end

  sentence
end
