=begin
Leap Years (Part 1)

In the modern era under the Gregorian Calendar, leap years occur in every year
that is evenly divisible by 4, unless the year is also divisible by 100. If the
year is evenly divisible by 100, then it is not a leap year unless the year is
evenly divisible by 400.

Assume this rule is good for any year greater than year 0. Write a method that
takes any year greater than 0 as input, and returns true if the year is a leap
year, or false if it is not a leap year.
=end

=begin
PEDAC
P
Input:
- An integer that represents the year (greater than 0)
Output:
- Boolean of whether the input year is a leap year

E
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true

D
Input: An integer
Output: A boolean value

A
General
A year is a leap year IF:
- Evenly divided by 4 and NOT evenly divided by 100
- OR
- IF it is evenly divided by 100, it is still a leap year if it is evenly
  divided by 400
=end

def leap_year?(year)
  (year % 4 == 0 && year % 100 != 0) || (year % 100 == 0 && year % 400 == 0)
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true

# OFFICIAL SOLUTION
def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  elsif year % 4 == 0
    true
  end
end

def leap_year?(year)
  (year % 400 == 0) || (year % 100 != 0 && year % 4 == 0)
end
