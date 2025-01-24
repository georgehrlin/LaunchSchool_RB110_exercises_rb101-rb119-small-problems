=begin
FURTHER EXPLORATION
Try modifying your solution so it prints the triangle upside down from its
current orientation. Try modifying your solution again so that you can display
the triangle with the right angle at any corner of the grid.
=end

# Try modifying your solution so it prints the triangle upside down from its
# current orientation.
def triangle_upside_down(side_length)
  num_spaces = 0
  num_stars = side_length
  until num_spaces == side_length
    puts "#{' ' * (num_spaces)}#{'*' * num_stars}"
    num_spaces += 1
    num_stars -= 1
  end
end

triangle_upside_down(5)
puts ''
triangle_upside_down(9)
