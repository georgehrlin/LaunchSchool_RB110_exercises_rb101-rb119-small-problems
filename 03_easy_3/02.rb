=begin
Counting the Number of Characters

Write a program that will ask a user for an input of a word or multiple words
and give back the number of characters. Spaces should not be counted as a
character.

Examples:

Please write word or multiple words: walk
There are 4 characters in "walk".

Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".
=end

=begin
PEDAC
P
Input:
- An user input string
Output
- An output of an interpolated string with the number of characters in the user
  input string and the input string itself

E
Please write word or multiple words: walk
There are 4 characters in "walk".

Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".

D
Input: A string, user input
Output: A string interpolated with an integer and input string

A
- Prompt user to enter a string. Assign string to a var, input
- Output a string with both number of characters in input and input itself
  interpolated
=end

print 'Please write word or multiple words: '
input = gets.chomp
puts "There are #{input.delete(' ').size} characters in \"#{input}\"."
