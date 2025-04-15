=begin
Triangle Sides

Write a method that takes the lengths of the 3 sides of a triangle as
arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid
depending on whether the triangle is equilateral, isosceles, scalene, or
invalid.
=end

=begin
PEDAC
P
Input:
- Three ints that are the side lengths of a triangle
Output:
- A sym that is the identity of the triangle
  - :equilateral
    - All side lengths are equal
  - :isosceles
    - Two of the three side lengths are equal
  - :scalene
    - All side lengths are different
  - :invalid
    - Either one of the side length is 0
    - Or the sum of the two shorter side lengths is NOT larger than the largest
      side length

E
triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

D
Input: Three ints
Output: A sym

A
- Check if triangle is valid. Return :invalid IF
  - Use any to check if one of the sides is 0
  - Use sort and idx to find the two shorter sides
  - Sum of two shorter sides < longest side
- Otherwise:
  - Return :equilateral if all sides are equal
    - First side is same as second
    - Second is also same as third
  - Return :isoceles if two sides are equal
    - Either firs side is same as second, or second is same as third
  - Return :scalene if all sides are unequal
    - NOT equilateral NOR isoceles
=end

def triangle(s1, s2, s3)
  sorted = [s1, s2, s3].sort
  if sorted.any? { |s| s == 0 } || (sorted[0] + sorted[1]) < sorted.last
     :invalid
  elsif sorted[0] == sorted[1] && sorted[1] == sorted[2]
    :equilateral
  elsif sorted[0] == sorted[1] || sorted[1] == sorted[2]
    :isoceles
  else
    :scalene
  end
end

# NOTE: It is unneccessary to check if one of the sides is 0 if the arr is
# sorted first, because the sum of the first two sides will always be smaller
# or equal to the third if one the first two sides is 0.

p triangle(3, 3, 3) # == :equilateral
p triangle(3, 3, 1.5) # == :isosceles
p triangle(3, 4, 5) # == :scalene
p triangle(0, 3, 3) # == :invalid
p triangle(3, 1, 1) # == :invalid

# OFFICIAL SOLUTION
def triangle(s1, s2, s3)
  sides = [s1, s2, s3]
  largest = sides.max

  case
  when 2 * largest > sides.sum, sides.include?(0)
    :invalid
  when s1 == s2 && s2 == s3
    :equilateral
  when s1 == s2 || s2 == s3 || s1 == s3
    :isoceles
  else
    :scalene
  end
end
