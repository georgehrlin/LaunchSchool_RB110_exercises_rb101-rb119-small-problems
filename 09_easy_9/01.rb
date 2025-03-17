=begin
Welcome Stranger

Create a method that takes 2 arguments, an array and a hash. The array will
contain 2 or more elements that, when combined with adjoining spaces, will
produce a person's name. The hash will contain two keys, :title and
:occupation, and the appropriate values. Your method should return a greeting
that uses the person's full name, and mentions the person's title and occupation.

Example:
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."
=end

=begin
PEDAC
P
Input:
- An arr
  - Two or more strs that, when combined, represent a person's full name
- A hsh
  - Two syms as keys (:title and :occupation)
  - Two strs as vals
Output:
- A str that is a greeting that interpolates the full name, title, and
  occupation from input arr and hsh

E
greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
=> "Hello, John Q Doe! Nice to have a Master Plumber around."

D
Input: An arr of strs and a hsh of syms as k and strs as v
Output: A str

A
- Construct and return a string according to the format needed
=end

def greetings(arr_name, hsh_info)
  full_name = arr_name.join(' ')
  "Hello, #{full_name}! " +
  "Nice to have a #{hsh_info[:title]} #{hsh_info[:occupation]} around."
end

p greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
# => "Hello, John Q Doe! Nice to have a Master Plumber around."