# OFFICICAL SOLUTION

=begin
SOLUTION 1
A
- Initialize a result array to collect characters that meet the final criteria
- Convert input string into an array of characters
- Iterate over array
  - IF character is alphabetic
    - Append it to result array
  - ELSE
    - Append ' ' to result arr UNLESS last element of result arr is already ' '
- Return result array
- Convert result array into string
=end

ALPHABET = ('a'..'z').to_a

def cleanup(text)
  clean_chars = []

  text.chars.each do |char|
    if ALPHABET.include?(char)
      clean_chars << char
    else
      clean_chars << ' ' unless clean_chars.last == ' '
    end
  end

  clean_chars.join
end

p cleanup("---what's my +*& line?") # == ' what s my line '

# SOLUTION 2
def cleanup(text)
  text.gsub(/[^a-z]/, ' ').squeeze(' ')
end

# By Wayne Olson
def cleanup(text)
  text.gsub(/[^a-z]+/, ' ')
end
