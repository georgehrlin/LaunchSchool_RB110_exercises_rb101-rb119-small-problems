=begin
How Many

Write a method that counts the number of occurences of each element in a given
array.

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print
each element alongside the number of occurrences.

Example:
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

Expected output:
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

=begin
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

vehicles.tally.each { |car, num| puts "#{car} => #{num}" }
=end

=begin
PEDAC
P
Input:
- An arr of strs
Output:
- An output of each str in input arr followed by the number of its occurence in
  the input arr

E
vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

# Output:
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2

D
Input: An arr of strs
Output: An output of interpolated strs

A
- Initialize an arr that contains only unique strs in input arr
- Iterate over arr of unique strs
  - Output an interpolated str that includes the str and the number of that str
    in the original input arr
=end

def count_occurrences(arr)
  arr_unique = arr.uniq
  arr_unique.each { |ele| puts "#{ele} => #{arr.count(ele)}" }
end

# FURTHER EXPLORATION
# Try to solve the problem when words are case insensitive. For instance:
# "suv" == "SUV".

def count_occurrences(arr)
  arr_downcase = arr.map { |ele| ele.downcase } # Or: arr.map(&:downcase)
  arr_downcase.uniq.each do |ele|
    puts "#{ele} => #{arr_downcase.count(ele)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'CAR', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'TRUCK'
]

count_occurrences(vehicles)
