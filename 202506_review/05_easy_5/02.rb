=begin
PEDAC
P
Input: An integer that represents minutes before or after midnight
  - If negative/positive, minutes before/after midnight
Output: A string that represents the time of day based on input intger in
  24-hour format
Explicit:
  - Do not use Ruby's Date and Time classes

E
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"

D
Input: An integer
Output: A string

A
- If input integer is negative, convert it to equivalent positive integer
  - Negative input modulo 1440 (number of minutes per day)
  - Example: -1437
    - -1437 is 00:03, so 3
    - -1437 % 1440 => 3
  - Example: -4231
    - -4231 is 01:29, so 89
    - -4231 % 1440 => 89
- If input intger is larger than 1440, convert it to equivalent minutes smaller
  than 1440
- Determine hour
  - Use positive input
  - Positive input positive division 60
    - 3 / 60 => 0 (00:03)
    - 800 / 60 => 13 (13:20)
- Determine minute
  - Use positive input
  - Positive input modulo 60
    - 3 % 60 => 3
    - 800 % 60 => 20
- Structure a 24-hour string with hour and minute interpolated
=end

SECONDS_PER_MINUTES = 60
MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY  = MINUTES_PER_HOUR * HOURS_PER_DAY

=begin
# Original answer by me
def convert_negative_minutes(minutes)
  minutes % MINUTES_PER_DAY
end

def time_of_day(minutes)
  minutes = convert_negative_minutes(minutes) if minutes.negative?
  minutes %= MINUTES_PER_DAY if minutes > MINUTES_PER_DAY

  h = minutes / MINUTES_PER_HOUR
  m = minutes % MINUTES_PER_HOUR

  "#{format('%02d', h)}:#{format('%02d', m)}"
end
=end

=begin
# Improved version after LSBot's review and reading Official Solution
def time_of_day(minutes)
  minutes %= MINUTES_PER_DAY if minutes.negative? || minutes > MINUTES_PER_DAY

  h = minutes / MINUTES_PER_HOUR
  m = minutes % MINUTES_PER_HOUR

  format('%02d:%02d', h, m)
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"
=end

=begin
Notes on Kernel#format

#format takes an argument format_string and arguments *arguments
- format_string contains zero or more embedded format specifications
- *arguments are zero or more objects to be formatted

#format returns the string resulting from replacing each format specification
embedded in format_string with a string form of the corresponding argument
among arguments.

A format specification has the form:
%[flags][width][.precision]type

In my case of format('%02d', h)
0 is the flag: Left-pad with zeros instead of spaces
2 is the width specifier: Determines the minimum width of the formatted field
d is the type specifier: Format argument as a decimal integer
=end

=begin
FURTHER EXPLORATION
Problem 1

As far as I can tell from working on this main problem, whether the result of
calling % on a negative number is positive or not depends on the argument. As
shown in my improved time_of_day, I can normalize both a negative delta minutes
and one that is larger than 1439 by calling % on them with the total number of
minutes per day. The total number of minutes per day is always a positive
number, thus a correct, positive normalized delta minutes is yielded.
=end

=begin
Problem 2

I am not familiar with Ruby's Date and Time classes whatsoever. I looked into
the Time class and came up with the not-so-elegant solution below.

"It ain't much but it's honest work."
=end

=begin
def time_of_day(delta_minutes)
  t = (Time.new(0) + (SECONDS_PER_MINUTES * delta_minutes))
  t.strftime()
  format('%02d:%02d', t.hour, t.min)
end
=end

=begin
Problem 3

Once again I don't know the two classes well. I mentioned previously that my
solution is not so elegant. The main not-so-elegant part below has to do with
how I structured the reference time (Time.new(0, 1, 7)). I am not sure if there
is a better way. I believe my solution works though.
=end

def time_of_day(delta_minutes)
  t = (Time.new(2025, 6, 8) + (SECONDS_PER_MINUTES * delta_minutes))
  t.strftime('%A %H:%M')
end

p time_of_day(-4231)
