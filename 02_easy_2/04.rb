=begin
When will I Retire?
Build a program that displays when the user will retire and how many years she
has to work till retirement.

Example:
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

=begin
PEDAC
P
Input:
1. An integer that represents one's age
2. An integer that represents the age at which one likes to retire
Output:
- An output of string with the current year, retirement year, and the number of
  years left until retirement included

E
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!

D
Input:
1. An integer
2. An integer
Output:
- An output of a string with three integers interpolated

A
- Prompt user to enter current age
- Assign current age to a var, age_current
- Prompt user to enter retirement age
- Assign retirement age to a var, age_retire
- Calculate difference in years between age_current and age_reitre, assign it
  to a var, years_to_retirement
- Output a string with current year, retirement year, and years_to_retirement
  interpolated
  - Use Ruby's module that deals with time
  - Calculate retirement year in interpolation
=end

print 'What is your age? '
age_current = gets.to_i

print 'At what age would you like to retire? '
age_retire = gets.to_i

years_to_retirement = age_retire - age_current
year_current = Time.now.year
year_retire = year_current + years_to_retirement

print "\n"
print "It's #{year_current}. You will retire in #{year_retire}.\n" \
      "You have only #{years_to_retirement} years of work to go!"
