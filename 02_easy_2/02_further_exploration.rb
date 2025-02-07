=begin
Further Exploration
Modify this program to ask for the input measurements in feet, and display the
results in square feet, square inches, and square centimeters.
=end

SQFT_TO_SQIN = 144
SQFT_TO_SQCM = 929.0304

puts 'Enter the length of the room in feet:'
length_ft = gets.to_f

puts 'Enter the width of the room in width:'
width_ft = gets.to_f

area_sqft = (length_ft * width_ft).round(2)
area_sqin = (area_sqft * SQFT_TO_SQIN).round(2)
area_sqcm = (area_sqft * SQFT_TO_SQCM).round(2)

puts "The area of the room is #{area_sqft} sqaure feet " \
     "(#{area_sqin} square inches, #{area_sqcm} square centimeters)."
