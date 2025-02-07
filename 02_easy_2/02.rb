=begin
How big is the room?
Build a program that asks a user for the length and width of a room in meters
and then displays the area of the room in both square meters and square feet.

Note: 1 square meter == 10.7639 square feet

Do not worry about validating the input at this time.

Example Run
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end

=begin
PEDAC
P
Input:
1. An integer that stands for the length of the room
2. An integer that stands for the width of the room
Output:
- Output of a string interpolated with the product of the two input integers in
  square meters and square feet

E
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).

D
Input:
1. An integer
2. An integer
Output:
- Output of a string interpolated with two integers

A
- Prompt user to enter length of room in meters
- Initialize var, length, to save user input
- Prompt user to enter width of room in meters
- Initialize var, width, to save user input
- Calculate area in square meters and save to a var, area_square_meters
- Calculate area in square feet and save to a var, area_square_feet
- Output are in both square meters and square feet with area_square_meters and
  area_square_feet interpolated
=end

=begin
puts 'Enter the length of the room in meters:'
length = gets.to_f
puts 'Enter the width of the room in meters:'
width = gets.to_f
area_square_meters = length * width
area_sqaure_feet = area_square_meters * 10.7639
puts "The area of the room is #{area_square_meters} square meters " \
     "(#{area_sqaure_feet} square feet)."
=end

# OFFICIAL SOLUTION
SQMETERS_TO_SQFEET = 10.7639

puts 'Enter the length of the room in meters:'
length = gets.to_f

puts 'Enter the width of the room in meters:'
width = gets.to_f

square_meters = (length * width).round(2)
square_feet = (square_meters * SQMETERS_TO_SQFEET).round(2)

puts "The area of the room is #{square_meters} " \
     "sqaure meters (#{square_feet} square feet)."
