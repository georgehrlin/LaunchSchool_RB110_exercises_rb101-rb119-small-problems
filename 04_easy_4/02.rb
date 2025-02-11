=begin
What Century is That?

Write a method that takes a year as input and returns the century. The return
value should be a string that begins with the century number, and ends with st,
nd, rd, or th as appropriate for that number.

New centuries begin in years that end with 01. So, the years 1901-2000 comprise
the 20th century.

Examples:
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
=end

=begin
PEDAC
P
Input:
- An integer that represents the year
Output:
- A string that represents the century the input year is in
  - It's got to have the correct ending: "st", "nd", or "th"

E
century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'

D
Input: An integer
Intermediary: An integer
Output: A string

A
Problem 1: Determine the number of century the input year is in

Draft
2000  -> 20
2001  -> 21
256   -> 3
5     -> 1
10103 -> 102

Every century is 100 years
There is no century 0. Century starts at 1
So basically century is the -th 100 years

A
- IF year / 100 is a whole number
  - year / 100 is century number
- ELSIF year / 100 is not a whole number
  - year / 100 + 1 is century number
=end

def century_num(year)
  year % 100 == 0 ? year / 100 : year / 100 + 1
end

=begin
Problem 2: Determine appropriate ordinal suffixies

Draft
If century number ends in:
- 1 -> st
- 2 -> nd
- 3 -> rd
- 0, 4-9 -> th
=end

def century(year)
  century_val = century_num(year)

  suffix = if %w[11 12 13].include?(century_val.to_s[-2, 2])
    'th'
  elsif century_val.to_s[-1] == '1'
    'st'
  elsif century_val.to_s[-1] == '2'
    'nd'
  elsif century_val.to_s[-1] == '3'
    'rd'
  else
    'th'
  end

  century_val.to_s + suffix
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'

# OFFICIAL SOLUTION
def century(year)
  century = year / 100 + 1
  century -= 1 if year % 100 == 0
  century.to_s + century_suffix(century)
end

def century_suffix(century)
  return 'th' if [11, 12, 13].include?(century % 100)
  last_digit = century % 10

  case last_digit
  when 1 then 'st'
  when 2 then 'nd'
  when 3 then 'rd'
  else 'th'
  end
end
