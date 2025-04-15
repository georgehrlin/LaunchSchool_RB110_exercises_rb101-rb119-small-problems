=begin
Tri-Angles

Write a method that takes the 3 angles of a triangle as arguments, and returns
a symbol :right, :acute, :obtuse, or :invalid depending on whether the triangle
is a right, acute, obtuse, or invalid triangle.

You may assume integer valued angles so you don't have to worry about floating
point errors. You may also assume that the arguments are specified in degrees.
=end

=begin
PEDAC
P
Input:
- Three ints that are the angles of a triangle
Output:
- A sym that is the type of the triangle based on the three input angles
Explicit:
- Angle vals can be assumed to be only ints
- Thee triangle types
  - Right: One angle val is 90
  - Acute: All angle vals are < 90
  - Obtuse: One angle val is > 90
- A valid triangle is
  - All angle vals sum up to exactly 180
  - All angle vals are > 0

E
triangle(60, 70, 50) == :acute
triangle(30, 90, 60) == :right
triangle(120, 50, 10) == :obtuse
triangle(0, 90, 90) == :invalid
triangle(50, 50, 50) == :invalid

D
Input: Three ints
Output: A sym

A
- Check if all input vals are > 0 AND input vals sum up to 180 exactly
  - IF not, return :invalid
  - IF yes
    - Check if any of input vals is 90
      - IF yes, return :right
    - Check if any of input vals is > 90
      - IF yes, return :obutse
    - ELSE
      - Return :acute
=end

def triangle(a1, a2, a3)
  angles = [a1, a2, a3]
  return :invalid if (angles.any?(0) || angles.sum != 180)

  case
  when angles.any?(90) then :right
  when angles.any? { |angle| angle > 90 } then :obtuse
  else :acute
  end
end

# OFFICIAL SOLUTION
def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  case
  when angles.reduce(:+) != 180, angles.include?(0)
    :invalid
  when angles.include?(90)
    :right
  when angles.all? { |angle| angle < 90 }
    :acute
  else
    :obtuse
  end
end

# By kramerkeller
def triangle(*angles)
  return :invalid if angles.sum != 180 || angles.include?(0)
  return :acute if angles.max < 90
  return :right if angles.include?(90)
  return :obtuse if angles.max > 90
end
