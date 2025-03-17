=begin
Name Swapping

Write a method that takes a first name, a space, and a last name passed as a
single String argument, and returns a string that contains the last name, a
comma, a space, and the first name.

Examples:
swap_name('Joe Roberts') == 'Roberts, Joe'
=end

=begin
PEDAC
P
Input:
- A str that represents a full name
Output:
- A new str with last name first, a comma, a space, then first name

E
swap_name('Joe Roberts') == 'Roberts, Joe'

D
Input: A str
Output: A str

A
- Split input str into an arr of strs and assign them to two vars
- Construct and return final str using the two vars
=end

=begin
def swap_name(full_name)
  first_name, last_name = full_name.split
  "#{last_name}, #{first_name}"
end
=end

# OFFICIAL SOLUTION
def swap_name(name)
  name.split.reverse.join(', ')
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
