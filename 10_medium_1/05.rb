=begin
Diamonds!

Write a method that displays a 4-pointed diamond in an n x n grid, where n is
an odd integer that is supplied as an argument to the method. You may assume
that the argument will always be an odd integer.

Examples:
diamond(1)

*

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end

=begin
PEDAC
P
Input:
- An odd int that represents the width and length of the output diamond
Output:
- An output that is a diamond of input int width and length

E
diamond(1)

*

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *

D
Input: An int
Output: An output of strs

A
Draft
4 spaces, 1 *
3 spaces, 3 *
2 spaces, 5 *
1 space,  7 *
0 space,  9 *
1 space,  7 *
2 spaces, 5 *
3 spaces, 3 *
4 spaces, 1 *

- Initialize a var mid_point that is input int / 2

- First half
  - Initialize num_* that points to 1
  - Iteate mid_point number of times
    - Output (mid_point - iteration num) number of spaces and (num_*) number
      of *
    - num_* increases by 2

- Middle
  - Output input int number of *

- Second half
  - Initialize num_* that points to input int - 2
  - Output (iteration num + 1) number of spaces and (num_*) number
      of *
  - num_* decreases by 2
=end

def diamond(size)
  mid_point = size / 2

  puts ' '

  num_star = 1
  mid_point.times do |n| 
    puts "#{' ' * (mid_point - n)}#{'*' * num_star}"
    num_star += 2
  end
  
  puts "#{'*' * size}"

  num_star = size - 2
  mid_point.times do |n|
    puts "#{' ' * (n + 1)}#{'*' * num_star}"
    num_star -= 2
  end
end

# OFFICIAL SOLUTION
def print_row(grid_size, distance_from_center)
  number_of_stars = grid_size - 2 * distance_from_center
  stars = '*' * number_of_stars
  puts stars.center(grid_size)
end

def diamond(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(0) { |distance| print_row(grid_size, distance) }
  1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
end
