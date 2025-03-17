=begin
Grade book

Write a method that determines the mean (average) of the three scores passed to
it, and returns the letter value associated with that grade.

Numerical Score Letter Grade
90 <= score <= 100      'A'
80 <= score < 90        'B'
70 <= score < 80        'C'
60 <= score < 70        'D'
0  <= score < 60        'F'
Tested values are all between 0 and 100. There is no need to check for negative
values or values greater than 100.

Examples:
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"
=end

=begin
PEDAC
P
Input:
- Three ints that represent three scores
Output:
- A str that represents the letter grade associated with the mean of the three
  input score ints
  - 90 <= score <= 100      'A'
    80 <= score < 90        'B'
    70 <= score < 80        'C'
    60 <= score < 70        'D'
    0  <= score < 60        'F'

E
get_grade(95, 90, 93) == "A"
get_grade(50, 50, 95) == "D"

D
- Input: Three ints
- Output: A str

A
- Calculate mean based on three input ints
- Determine and return letter grade based on mean using conditionals
=end

=begin
def get_grade(score1, score2, score3)
  average = [score1, score2, score3].sum / 3.0

  case
  when average >= 90
    'A'
  when average >= 80
    'B'
  when average >= 70
    'C'
  when average >= 60
    'D'
  else
    'F'
  end
end
=end

=begin
# OFFICIAL SOLUTION
def get_grade(score1, score2, score3)
  average = (score1 + score2 + score3) / 3

  case average
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end
=end

=begin
FURTHER EXPLORATION

How would you handle this if there was a possibility of extra credit grades
causing it to exceed 100 points?
=end

def get_grade(score1, score2, score3)
  average = [score1, score2, score3].sum / 3.0

  case average
  when 100...  then 'S'
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end
