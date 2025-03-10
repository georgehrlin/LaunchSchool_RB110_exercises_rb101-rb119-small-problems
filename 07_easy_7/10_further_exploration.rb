=begin
FURTHER EXPLORATION
Our solution ignored a couple of edge cases because we explicitly stated that
you didn't have to handle them: strings that contain just one word, and strings
that contain no words.

Suppose we need a method that retrieves the middle word of a phrase/sentence.
What edge cases need to be considered? How would you handle those edge cases
without ignoring them? Write a method that returns the middle word of a phrase
or sentence. It should handle all of the edge cases you thought of.
=end

=begin
Q: What edge cases need to be considered?
A: The edge cases are:
- An empty argument string;
- An argument string with only one word;
- An argument string with an even number of words, so which is the middle word
  in this scenario must be defined first

Q: How would you handle those edge cases without ignoring them?
A: For this specific problem, because I have to first identify the word that is
at the middle position of a sentence, I will have to calculate to find the
number that indicates its position in a collection of words, which is its index
once the phrase/sentence is converted into an array of words.

An empty argument string:
An empty string should be returned in this scenario.

An argument string with only one word:
The only word of the argument string should be returned in this scenario.

An empty argument string an even number of words:
I have a few options here to define what is returned when the input string has
an even number of words. I can have the method return nil or just an empty
string, because technically there is no a middle word in such a collection of 
words. I can also have the method return the word that comes before the 
"mid-point" of the sentence or after, or just return both of them.

In this scenario the two strings just before and after the "mid-point" should
be returned as a single string with an empty space between them.
=end

=begin
PEDAC
P
Input:
- A str that is a sentence with any number of words, but can also be empty
Output:
- A str that is at the middle position of the input sentence str

E
middle_word('The slings and arrows of outrageous fortune')
middle_word('') # => ""
middle_word('Swol') # => "swol"
middle_word('To be or not to be') # => "or not"

D
Input: A str
Intermediate: An arr of strs
Output: A str

A
- Split input str into an arr of strs
- Determine middle index by dividing number of arr by 2
- IF arr is empty
  - Return an empty str
- ELSIF arr's size is even
  - Return a str consisting of words at indices (middle index - 1) and middle
    index
- ELSE
  - Return str at middle index
=end

def middle_word(words)
  arr_words = words.split
  idx_middle = arr_words.size / 2

  if arr_words.empty?
    ''
  elsif arr_words.size.even?
    "#{arr_words[idx_middle - 1]} #{arr_words[idx_middle]}"
  else
    arr_words[idx_middle]
  end
end

p middle_word('The slings and arrows of outrageous fortune') # => "arrows"
p middle_word('') # => ""
p middle_word('swol') # => "swol"
p middle_word('To be or not to be') # => "or not"
