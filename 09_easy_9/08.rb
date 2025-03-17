=begin
Grocery List

Write a method which takes a grocery list (array) of fruits with quantities and
converts it into an array of the correct number of each fruit.

Example:
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end

=begin
PEDAC
P
Input:
- An arr of subarrs that represents a grocery list
  - The elements of subarrs are one item str and one number int
Output:
- An arr of strs that represent the individual grocery items

E
buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]

D
Input: An arr of subarrs of a str and an int
Output: An arr of strs

A
- Initialize an empty arr to collect results
- Iterate over the subarrs of input arr
  - Append grocery number of item strs to result arr
- Return result arr
=end

=begin
def buy_fruit(arr_grocery)
  result = []
  arr_grocery.each do |item| 
    item.last.times { |_| result << item.first }
  end

  result
end
=end

# After reading Official Solution
def buy_fruit(list)
  list.each_with_object([]) do |(fruit, quantity), result|
    quantity.times { result << fruit }
  end
end

=begin
# OFFICIAL SOLUTION
def buy_fruit(list)
  expanded_list = []

  list.each do |fruit, quantity|
    quantity.times { expanded_list << fruit }
  end

  expanded_list
end
=end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
