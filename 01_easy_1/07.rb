=begin
Madlibs
Mad libs are a simple game where you create a story template with blanks for
words. You, or another player, then construct a list of words and place them
into the story, creating an often silly or funny story as a result.

Create a simple mad-lib program that prompts for a noun, a verb, an adjective,
and an adverb and injects those into a story that you create.

Example
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!
=end

=begin
PEDAC
P
Input:
- String, user input, a noun
- String, user input, a verb
- String, user input, an adjective
- String, user input, an adverb

Output:
- Output of a string that consists of all the user inputs

E
Enter a noun: dog
Enter a verb: walk
Enter an adjective: blue
Enter an adverb: quickly

Do you walk your blue dog quickly? That's hilarious!

D
Input: Four user inputs, all strings
Output: Output of an interpolated string

A
- Prompt user to input a noun string and store it in var noun
- Prompt user to input a verb string and store it in var verb
- Prompt user to input a adjective string and store it in var adjective
- Prompt user to input a adverb string and store it in var adverb
- Output an interpolated string with noun, verb, adjective, adverb in place
=end
=begin
def madlib
  print 'Enter a noun: '
  noun = gets.chomp
  print 'Enter a verb: '
  verb = gets.chomp
  print 'Enter an adjective: '
  adjective = gets.chomp
  print 'Enter an adverb: '
  adverb = gets.chomp
  print "\n"

  puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

madlib
=end
# OFFICIAL SOLUTION
print 'Enter a noun: '
noun = gets.chomp

print 'Enter a verb: '
verb = gets.chomp

print 'Enter an adjective: '
adjective = gets.chomp

print 'Enter an adverb: '
adverb = gets.chomp

sentence1 = "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
sentence2 = "The #{adjective} #{noun} #{verb}s #{adverb} over the lazy dog."
sentence3 = "The #{noun} #{adverb} #{verb}s up #{adjective} Joe's turtle"

puts [sentence1, sentence2, sentence3].sample
