=begin
PEDAC

What Century is That?
Write a method that takes a year as input and returns the century. The return
value should be a string that begins with the century number, and ends with
`st`, `nd`, `rd`, or `th` as appropriate for that number.

New centuries begin in years that end with `01`, so the years 1901 to 2000
comprise the 20th century.

P
Input: An integer number that represents a year
Output: A string that indicates the century of the input year. It begins with
        the century number, and ends with `st`, `nd`, `rd`, or `th` as
        appropriate

Rules:
- New centuries begin in years that end with `01`
  - E.g., 1901 is the first year of the 20th century

Representations:
5     -> 1st century   (year 0..100)
101   -> 2nd century   (year 101..200)
256   -> 3rd century   (year 201..300)
1999  -> 20th century  (year 1991..2000)
2000  -> 20th century  (year 1991..2000)
2001  -> 21st century  (year 2001..2100)
10103 -> 102nd century (year 10101..10200)
11201 -> 113th century (year 11201..11300)

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
- Input is an integer number
- Output is a string

A
Sub-Problem: Determine Century Number
- Create a `century_start` that starts at `0`
- Create a `century_end` that starts at `100`
- Create an inclusive range that starts with `century_start` and ends with
  `century_end`
- Create a loop that ends until range includes the input year
  - Check if the range includes the input year
    - If yes, return `century_end / 100` as the century number
    - If no, both `century_start` and `century_end` increment by 100

Sub-Problem: Format Century Number
Representations
1   -> 1st
2   -> 2nd
3   -> 3rd
4   -> 4th
10  -> 10th
11  -> 11th
12  -> 12th
13  -> 13th
14  -> 14th
20  -> 20th
21  -> 21st
22  -> 22nd
23  -> 23rd
24  -> 24th
102 -> 102nd
113 -> 113th

A
- If second last digit `1`
  - Append `th`
- Else if
  - If last digit `1`
    - Append `st`
  - If last digit `2`
    - Append `nd`
  - If last digit `3`
    - Append `rd`
- Else
  - Append `th`
=end

=begin
def century_num(year)
  century_start = 0
  century_end = 100

  loop do
    return century_end / 100 if (century_start..century_end).include?(year)
    century_start += 100
    century_end += 100
  end
end

def format_century(century)
  str = century.to_s

  if str[-2] == '1'
    str += 'th'
  elsif str[-1] == '1'
    str += 'st'
  elsif str[-1] == '2'
    str += 'nd'
  elsif str[-1] == '3'
    str += 'rd'
  else
    str += 'th'
  end

  str
end

def century(year)
  format_century(century_num(year))
end
=end

=begin
# Tests for century_num
p century_num(2000) == 20
p century_num(2001) == 21
p century_num(1965) == 20
p century_num(256) == 3
p century_num(5) == 1
p century_num(10103) == 102
p century_num(1052) == 11
p century_num(1127) == 12
p century_num(11201) == 113
=end

=begin
# Tests for format_century
p format_century(20) == '20th'
p format_century(21) == '21st'
p format_century(3) == '3rd'
p format_century(1) == '1st'
p format_century(102) == '102nd'
p format_century(11) == '11th'
p format_century(12) == '12th'
p format_century(113) == '113th'
=end

=begin
# Test for century
p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
=end

# Official Solution
=begin
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
=end

# Solution by Karis Tobias
=begin
def century(year)
  cent = (year.to_f / 100).ceil_to_s

  if cent.end_with?('1') && !(cent.end_with?('11'))
    cent << 'st'
  elsif cent.end_with?('2') && !(cent.end_with?('12'))
    cent << 'nd'
  elsif cent.end_with?('3') && !(cent.end_with?('13'))
    cent << 'rd'
  else
    cent << 'th'
  end
end
=end

# Solution by Christopher R Prigmore
def century(year)
  century = year.ceil(-2).digits.drop(2).reverse.join

  return century + 'th' if century.end_with?('11', '12', '13')
  return century + 'st' if century.end_with?('1')
  return century + 'nd' if century.end_with?('2')
  return century + 'rd' if century.end_with?('3')
  century + 'th'
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