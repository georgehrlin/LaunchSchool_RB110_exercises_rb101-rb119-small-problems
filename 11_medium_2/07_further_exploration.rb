=begin
Further Exploration

An interesting variation on this problem is to count the number of months that
have five Fridays. This one is harder than it sounds since you must account for
leap years.
=end

=begin
PEDAC
P
Input:
- An int that represents the year
Output:
- An int that is the number of months that have five Fridays

E
num_months_w_five_fridays(2015) == 4
num_months_w_five_fridays(2025) == 4
num_months_w_five_fridays(1989) == 2

D
Input: An int
Output: An int

A
- Initialize an accumulator to keep track of months with five Fridays
- Loop over every month in input year
  - Initialize an accumulator to keep track of number of Fridays
  - Loop every day in the month
    - Fridays accumulator increases by 1 if it's a Friday
  - Five Fridays accumulator increases by 1 if Firdays accumulator is 5
- Return Five Fridays accumulator
=end

require 'date'

def num_months_w_five_fridays(year)
  months_w_five_fridays = 0
  first_day_of_month = Date.new(year)
  12.times do
    fridays = 0
    (first_day_of_month..first_day_of_month.next_month.prev_day).each do |day|
      fridays += 1 if day.friday?
    end
    first_day_of_month = first_day_of_month.next_month
    months_w_five_fridays += 1 if fridays == 5
  end

  months_w_five_fridays
end

p num_months_w_five_fridays(2020) == 4
p num_months_w_five_fridays(2019) == 4
p num_months_w_five_fridays(2016) == 5
p num_months_w_five_fridays(2008) == 4
