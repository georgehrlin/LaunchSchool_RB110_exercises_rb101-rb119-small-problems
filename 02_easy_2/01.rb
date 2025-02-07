=begin
How old is Teddy?
Build a program that randomly generates and prints Teddy's age. To get the age,
you should generate a random number between 20 and 200.

Example Output
Teddy is 69 years old!
=end

=begin
PEDAC
P
Input: None
Output: An output of a string that includes a randomly generated number which
        is between 20 and 200

E
Example Output
Teddy is 69 years old!

D
Input: None
Output: A string with a randomly generated integer interpolated

A
- Randomly generate a number between 20 and 200
- Interpolate number in a string and output it
=end

# puts "Teddy is #{(20..200).to_a.sample} years old!"
# puts "Teddy is #{rand(20..200)} years old!"

=begin
Further Exploration
Modify this program to ask for a name, and then print the age for that person.
For an extra challenge, use "Teddy" as the name if no name is entered.
=end

=begin
def age_generator
  puts 'Enter the name of the person for whom a random age will be generated:'
  name = gets.chomp
  if name.empty?
    puts 'Nothing was entered!'
    sleep(1.5)
    puts "We'll call him Teddy then?"
    sleep(1.5)
    name = 'Teddy'
  end
  puts "#{name} is #{rand(20..200)} years old!"
end
=end

puts 'Enter the name of the person for whom a random age will be generated:'
name = ((name = gets) == '' ? 'Teddy' : name)
puts "#{name} is #{rand(20..200)} years old!"
