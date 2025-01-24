=begin
Right Triangles (Further Exploration Part II)
Write a method that takes three arguments: 
- side_length, a positive integer
- up_down that points to 'up' or 'down'
- left_right that points to 'left' or 'right'
The method displays a right triangle whose sides each has side_length stars.
The corner where the triangle's right angle is at is determined by up_down and
left_right.

Examples:
triangle(5, "down", "right")
    *
   **
  ***
 ****
*****

triangle(9, "down", "right")
        *
       **
      ***
     ****
    *****
   ******
  *******
 ********
*********

triangle(3, "up", "left")
***
**
*

triangle(2, "down", "left")
*
**

triangle(4, "up", "right")
****
 ***
  **
   *
=end

=begin
PEDAC
P
Input:
1. An integer that determines the number of '*' on each side of the right
   triangle
2. "up" or "down", which determines whether the base of the triangle is the
   first line or the last line
3. "left" or "right", which determines whether the adjacent side of the
   triangle is on the left or right

E
triangle(3, "up", "left")
***
**
*

triangle(2, "down", "left")
*
**

triangle(5, "down", "right")
    *
   **
  ***
 ****
*****

triangle(4, "up", "right")
****
 ***
  **
   *

D
Input: An integer, a string, a string
Output: An output of multiple strings

A
General:
- There are four slightly different algorithms depending on up_down and
  left_right:

  - If up_down is 'up' and left_right is 'left'
    - Create a loop that iterates side_length times
      - Output side_length number of '*'
      - Decrease side_length by 1

  - If up_down is 'down' and left_right is 'left'
    - Create a loop that iterates side_length times
      - Initialize var n with value 1
      - Output n number of '*'
      - Increment n by 1

  - If up_down is 'down' and left_right is 'right'
    - Create a loop that iterates side_length times using Integer#times and block parameter n
      - Output (side_length - n - 1) number of ' ' and (n + 1) number of '*'

  - If up_down is 'up' and left_right is 'right'
    - Create a loop that iterates side_length times using Integer#times and block parameter n
      - Output n number of ' ' and (side_length - n) number of '*'
=end

def triangle(side_length, up_down, left_right)
  case [up_down, left_right]
  when ['up', 'left']
    side_length.times { |n| puts "#{'*' * (side_length - n)}"}
  when ['down', 'left']
    side_length.times { |n| puts "#{'*' * (n + 1)}"}
  when ['down', 'right']
    side_length.times { |n| puts "#{(' ' * (side_length - n - 1)) + ('*' * (n + 1))}"}
  when ['up', 'right']
    side_length.times { |n| puts "#{(' ' * n) + ('*' * (side_length - n))}"}
  end
end

triangle(5, "up", "left")
puts ''
triangle(5, "down", "left")
puts ''
triangle(5, 'down', 'right')
puts ''
triangle(5, "up", "right")
puts ''
triangle(1, "up", "left")
puts ''
triangle(1, "down", "left")
puts ''
triangle(1, 'down', 'right')
puts ''
triangle(1, "up", "right")
