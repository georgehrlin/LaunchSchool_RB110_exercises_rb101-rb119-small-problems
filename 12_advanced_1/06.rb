=begin
Fix the Bug

The following code is expected to print:
[]
[21]
[9, 16]
[25, 36, 49]

However, it does not. Obviously, there is a bug. Find and fix the bug, then
explain why the buggy program printed the results it did.
=end

=begin
def my_method(array)
  if array.empty?
    []
  elsif
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
=end

=begin
The original outputs nil, nil, and nil from line 14 to 16 respectively. The bug
here is line 4 is missing a condition for the elsif clause, which leads to
a return value of nil so long as the input array is not empty.

To fix this code, based on the output provided, we swap the contents of the
elsif clause and the else clause, and add a condition to the elsif clause to
check if the input array only contains a single element.
=end

=begin
def my_method(array)
  if array.empty?
    []
  elsif array.size == 1
    [7 * array.first]
  else
    array.map do |value|
      value * value
    end
  end
end
=end

=begin
CORRECTION

Technically, the "conditional expression on the elsif isn't missing — at least
not as far as the Ruby parser is concerned. When Ruby gets to the end of the
elsif line and doesn't find a conditional expression, it's smart enough to go
looking for it on the next line."

In the original code, the expression on line 5 becomes the conditional
expression for elsif. And because map always returns a truthy value, this elsif
branch is always executed over the else branch. Finally, nil will always be the
return value of this elsif branch because nothing is specified after the map
call.
=end

# By Nick Johnson
def my_method(arr)
  arr.size == 1 ? [7 * arr.first] : arr.map(&:abs2)
end

p my_method([])
p my_method([3])
p my_method([3, 4])
p my_method([5, 6, 7])
