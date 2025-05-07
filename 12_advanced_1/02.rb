=begin
Seeing Stars

Write a method that displays an 8-pointed star in an nxn grid, where n is an
odd integer that is supplied as an argument to the method. The smallest such
star you need to handle is a 7x7 grid.
=end

=begin
PEDAC
P
Input:
- An int that represents the length of the side of the output star grid
  - Input int is at least 7
  - Input int is always odd
Output:
- An output that is multiple lines of str that make up a square star grid
  - Side length is input int

E
star(7)

*  *  *
 * * *
  ***
*******
  ***
 * * *
*  *  *

star(9)

*   *   *
 *  *  *
  * * *
   ***
*********
   ***
  * * *
 *  *  *
*   *   *

D
Input: An int
Output: Output of multiple strs

A
Analysis
- Given a 7 by 7 star grid
  - * space space * space space *
  - space * space * space *
  - space space * * * space space
  - * * * * * * *
  - space * * * space
  - space * space * space *
  - * space space * space space *

- Given a 9 by 9 star grid
  - * space space space * space space space *
  - space * space space * space space *
  - space space * space * space *
  - space space space * * *
  - * * * * * * * * *
  - space space space * * *
  - space space * space * space *
  - space * space space * space space
  - * space space space * space space space *

- Given a n by n star grid (n >= 7)
  - (Extending for n / 2 times)
  - ('*' + 2 space + '*' + 2 space + '*') centered in a size n line
  - ('*' + 1 space + '*' + 1 space + '*') centered in a size n line
  - ('*' + 0 space + '*' + 0 space + '*') centered in a size n line
  - ('*' * n)
  - ('*' + 0 space + '*' + 0 space + '*') centered in a size n line
  - ('*' + 1 space + '*' + 1 space + '*') centered in a size n line
  - ('*' + 2 space + '*' + 2 space + '*') centered in a size n line
  - (Extending for n / 2 times)
=end

=begin
def star(n)
  (n / 2).downto(1) do |x|
    line = '*' + ' ' * (x - 1) + '*' + ' ' * (x - 1) + '*'
    puts line.center(n)
  end

  puts '*' * n

  0.upto(n / 2 - 1) do |x|
    line = '*' + ' ' * (x) + '*' + ' ' * (x) + '*'
    puts line.center(n)
  end
end
=end

# OFFICIAL SOLUTION
def print_row(grid_size, distance_from_center)
  number_of_spaces = distance_from_center - 1
  spaces = ' ' * number_of_spaces
  output = Array.new(3, '*').join(spaces)
  puts output.center(grid_size)
end

def star(grid_size)
  max_distance = (grid_size - 1) / 2
  max_distance.downto(1) do |distance_from_center|
    print_row(grid_size, distance_from_center)
  end

  puts '*' * grid_size

  1.upto(max_distance) do |distance_from_center|
    print_row(grid_size, distance_from_center)
  end
end
