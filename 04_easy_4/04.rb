=begin
Leap Years (Part 2)

A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap
year. Prior to 1752, the Julian Calendar was used. Under the Julian Calendar,
leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to
determine leap years both before and after 1752.
=end

=begin
PEDAC
P
Input:
- An integer that represents the year
Output:
- A boolean value of whether the year is a leap year
Explicit:
- If a year before 1752 is evenly divided by 4, it is a leap year
- The rules of calculation for leap years after 1752 remain the same

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
leap_year?(1700) == true
leap_year?(1) == false
leap_year?(100) == true
leap_year?(400) == true

D
Input:
- An integer
Output:
- A boolean value

A
General
- Determine if the year is before 1752
  - If it is, determine if it is a leap year with modulo 4
  - If it is not, determine if it is a leap year with regular rules
=end

def leap_year?(year)
  if year < 1752
    year % 4 == 0
  else
    year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
  end
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
p leap_year?(1700) == true
p leap_year?(1) == false
p leap_year?(100) == true
p leap_year?(400) == true
