=begin
Right Triangles
Write a method that takes a positive integer, n, as an argument, and displays a
right triangle whose sides each have n stars. The hypotenuse of the triangle
(the diagonal side in the images below) should have one end at the lower-left
of the triangle, and the other end at the upper-right.

Examples:
triangle(5)
    *
   **
  ***
 ****
*****

triangle(9)
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********
=end

=begin
PEDAC
P
Input: An integer that determines the number of stars on each side of the right
       triangle that will be output
Output: An output of a right triangle with its hypoteneuse's one end at the
        lower-left and the other end at the upper-right

Explicit:
- Each line of output consists of ' ' and '*' only
- Each line starts with ' ' if there is any

E:
triangle(5)
# Output:
    *
   **
  ***
 ****
*****

triangle(9)
# Output:
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

D
Input: An integer
Output: Output of multiple strings

A
General:
- Start a loop that loops input integer times
  - Every loop outputs one line of the triangle
  - First loop outputs (input - 1) number of ' ' first, then (1) number of '*'
  - Second loop outptus (input - 2) number of ' ' first, then (2) number of '*'
  - ...
  - Last loop outputs (input - input) or 0 number of ' ' first, then (input) number of '*'

Specific:
- Initialize a var num_stars which points to 1
- Until input is 0
  - Ouptut a str of (input - num_stars) number of ' ' appended with num_stars number of '*'
  - input decreases by 1
  - num_stars increases by 1
=end

def triangle(side_length)
  num_stars = 1
  until side_length == 0
    puts "#{' ' * (side_length - 1)}#{'*' * num_stars}"
    side_length -= 1
    num_stars += 1
  end
end

triangle(5)
puts ''
triangle(9)

=begin
#OFFICIAL SOLUTION
def triangle(num)
  spaces = num - 1
  stars = 1

  num.times do |n|
    puts (' ' * spaces) + ('*' * stars)
    spaces -= 1
    stars += 1
  end
end
=end
