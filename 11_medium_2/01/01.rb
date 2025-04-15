=begin
Longest Sentence

Write a program that reads the content of a text file and then prints the
longest sentence in the file based on number of words. Sentences may end with
periods (.), exclamation points (!), or question marks (?). Any sequence of
characters that are not spaces or sentence-ending characters should be treated
as a word. You should also print the number of words in the longest sentence.
=end

=begin
PEDAC
P
Input:
A str that is all the content of a text file
Output:
An output of a str that is the longest sentece in the file
An output of a int that is the number of words in the longest sentence

D
Input: A str
Output:
- An output of a str
- An output of a str

A
- The content of the file is input as a str and assigned to a var, content
- Substitue all "\n\n" with a space
- Substitue all "\n" with a space

- Convert all content of the file into an arr of sentence strs
  - Initialize an empty arr, sentences, to collect sentence strs
  - Initialize an empty str, current_sentence, to collect char strs
  - Iterate over chars of input content str
    - IF current char is '.', '!', or '?'
      - Concatenate it to current_sentence
      - Append current_sentence to sentences
      - Reset current_sentence to an empty str
    - ELSIF current char is ' ' AND current_sentence is empty
      - (Do nothing)
    - ELSE
      - Concatenate it to current_sentence

- Convert arr of sentence strs to arr of sentence str sizes
  - Use map to iterate over sentences
    - On each sentence, use split to convert it into an arr of word strs
    - Then use size to convert it to num of words in the sentence
  - Assign arr to a var, sentence_sizes

- Return the length of the longest sentence str
  - Return the largest num in sentence_sizes

- Return the longest sentence str from sentences
  - Use the largest num to find its idx
  - Use this idx to return the longest sentence from sentences
=end

=begin
content = File.read('1.txt')
content.gsub!("\n\n", ' ')
content.gsub!("\n", ' ')

sentences = []
current_sentence = ''

content.each_char do |char|
  if ['.', '!', '?'].include?(char)
    current_sentence += char
    sentences << current_sentence
    current_sentence = ''
  elsif char == ' ' && current_sentence.empty?
  else
    current_sentence += char
  end
end

# Using regex from Hint
# sentences = content.split(/\.|\?|!/)

sentence_sizes = sentences.map { |sentence| sentence.split.size }

p longest_sentence_size = sentence_sizes.max

p sentences[sentence_sizes.index(longest_sentence_size)]
=end

# OFFICIAL SOLUTION
text = File.read('1.txt')
sentences = text.split(/\.|\?|!/)
p largest_sentence = sentences.max_by { |sentence| sentence.split.size }
p largest_sentence = largest_sentence.strip
number_of_words = largest_sentence.split.size

# puts "#{largest_sentence}"
puts "Containing #{number_of_words} words"
