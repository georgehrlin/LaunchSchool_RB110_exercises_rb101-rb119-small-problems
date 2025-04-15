=begin
Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by
an argument.

You may assume that the year is greater than 1752 (when the United Kingdom
adopted the modern Gregorian Calendar) and that it will remain in use for the
foreseeable future.
=end

=begin
PEDAC
P
Input:
- An int that is the year
Output:
- An int that is the number of Friday the 13ths in the input year

E
friday_13th(2015) == 3
friday_13th(1986) == 1
friday_13th(2019) == 2

D
Input: An int
Output: An int

A
- Loop over all the days in the input year
  - Accumulate a sum of Friday the 13ths and then return it
=end

require 'date'

def friday_13th(year)
  (Date.new(year)..Date.new(year, 12, 31)).select do |day|
    day.day == 13 && day.firday?
  end.size
end

# OFFICIAL SOLUTION
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteeth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end
