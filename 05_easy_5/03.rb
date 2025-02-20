=begin
After Midnight (Part 2)

As seen in the previous exercise, the time of day can be represented as the
number of minutes before or after midnight. If the number of minutes is
positive, the time is after midnight. If the number of minutes is negative, the
time is before midnight.

Write two methods that each take a time of day in 24 hour format, and return
the number of minutes before and after midnight, respectively. Both methods
should return a value in the range 0..1439.

You may not use Ruby's Date and Time methods.
=end

=begin
after_midnight
PEDAC
P
Input:
- A string that represents time in the 24-hour format
Output:
- An integer that corresponds to the input time in minutes after midnight

E
after_midnight('00:00') == 0
after_midnight('12:34') == 754
after_midnight('24:00') == 0

D
Input: A string
Output: An integer

A
General
- Split input str into two: hours and minutes
- Return sum of turning hours into int plus turning minutes into int
  - Unless sum is 1440, in this case return 0
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY

def after_midnight(time)
  hours, minutes = time.split(':')
  sum = hours.to_i * MINUTES_PER_HOUR + minutes.to_i
  sum == MINUTES_PER_DAY ? 0 : sum
end

p after_midnight('00:00') # == 0
p after_midnight('12:34') # == 754
p after_midnight('24:00') # == 0

=begin
after_midnight
PEDAC
P
Input:
- A string that represents time in the 24-hour format
Output:
- An integer that corresponds to the input time in minutes before midnight

E
before_midnight('00:00') == 0
before_midnight('12:34') == 686
before_midnight('24:00') == 0

D
Input: A string
Output: An integer

A
General
- The number of minutes before midnight is the difference of subtracting the
  total number of minutes in a day by the number of minutes after midnight of
  the same time
=end

def before_midnight(time)
  diff = MINUTES_PER_DAY - after_midnight(time)
  diff == MINUTES_PER_DAY ? 0 : diff
end

p before_midnight('00:00') == 0
p before_midnight('12:34') == 686
p before_midnight('24:00') == 0
