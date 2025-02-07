=begin
Greeting a user
Write a program that will ask for user's name. The program will then greet the
user.
If the user writes "name!" then the computer yells back to the user.

Examples

What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
=end

=begin
PEDAC
P
Input:
- A string that is a user input, supposed to be user's name
Output:
- An output of a string to greet user
- If user's input ends with "!" then a different, all capitalized string is
  output

E
What is your name? Bob
Hello Bob.

What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?

D
Input: A string
Output: Output of an interpolated string

A
- Output a message that asks for user's name
- Output a message based on user's input
  - If input does not end with "!", output a normal greeting
  - Else if input ends with "!", output special greeting
=end
=begin
print 'What is your name? '
username = gets.chomp

if username[-1] == '!'
  print "HELLO #{username.upcase.[](0..-2)}. WHY ARE WE SCREAMING?"
else
  print "Hello #{username}."
end

# OFFICIAL SOLUTION
print 'What is your name? '
username = gets.chomp

if username[-1] == '!'
  username = username.chop
  puts "HELLO #{username.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{username}."
end
=end
=begin
FURTHER EXPLORATION
Try modifying our solution to use String#chomp! and String#chop!, respectively.
=end

print 'What is your name? '
username = gets.chomp!

if username[-1] == '!'
  username.chop!
  puts "HELLO #{username.upcase}. WHY ARE WE SCREAMING?"
else
  puts "Hello #{username}."
end
