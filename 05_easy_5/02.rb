=begin
After Midnight (Part 1)

The time of day can be represented as the number of minutes before or after
midnight. If the number of minutes is positive, the time is after midnight. If
the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the
time of day in 24 hour format (hh:mm). Your method should work with any integer
input.

You may not use Ruby's Date and Time classes.
=end

=begin
PEDAC
P
Input:
- An integer, positive or negative, that represents the number of minutes after
  or before midnight
Output:
- A string that represetns the time corresponding to the input minutes in the
  24-hour format

E
time_of_day(0) == "00:00"
time_of_day(30) == "00:30"
time_of_day(60) == "01:00"
time_of_day(-30) == "23:30"
time_of_day(-45) == "23:15"
time_of_day(-60) == "23:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
time_of_day(4321) == "00:01"
time_of_day(4501) == "03:01"

D
Input: An integer
Intermediary: Integers
Output: A string

A
General
- Split the problem into two
  - First one is to convert input minutes integer into two numbers that
    represent hour and minute
  - Second one is to convert the numbers representing hour and minute into a
    string that represents the corresponding time in the 24-hour format

Sketch
  - Larger than 1440
    - time_of_day(4321) # => "00:01"
      - 4321.divmod(1440) # => [3, 1]
    - time_of_day(4501) # => "03:01"
      - 4501.divmod(1440) # => [3, 181]
        - 181.divmod(60) # => [3, 1]

  - (0..1440)
    - time_of_day(1440) # => "00:00"
      - 1440.divmod(1440) # => [1, 0]
      - 1440.divmod(60) # => [24, 0]

  - (-1440..0)
    - time_of_day(-30) # => "23:30"
      - -30.divmod(60) # => [-1, 30]

  - Less than -1440
    - time_of_day(-4321) # => "01:29"
      - -4321.divmod(1440) # => [-3, 89]
      - 89.divmod(60) # => [1, 29]

- One day is 1440 minutes, so for input integer > 1440, use 1440 as divisor to
  find remainder
- For number between 0 and 1440 inclusive, use 60 and divmod to find the hour
  and the minute
- Use remainder from dividing by 60 to find minutes
=end

=begin
First sub-problem:
Convert input minutes integer into two numbers that represent hour and minute

PEDAC
P
Input:
- An integer, positive or negative, that represents the number of minutes after
  or before midnight
Output:
- An array of two integers with the first integer representing the correct
  hour and the second representing the correct minute

E
min_to_hour_n_min(0) == [0, 0]
min_to_hour_n_min(30) == [0, 30]
min_to_hour_n_min(60) == [1, 0]
min_to_hour_n_min(-30) == [23, 30]
min_to_hour_n_min(-45) == [23, 15]
min_to_hour_n_min(-60) == [23, 0]
min_to_hour_n_min(800) == [13, 20]
min_to_hour_n_min(-4231) == [1, 29]
min_to_hour_n_min(4321) == [0, 1]
min_to_hour_n_min(4501) == [3, 1]

D
Input: An integer
Output: An array of two integers

A
Sketch
  - Larger than 1440
    - min_to_hour_n_min(4321) # => [0, 1]
      - 4321.divmod(1440) # => [3, 1]
      - 1.divmod(60) # => [0, 1]
    - min_to_hour_n_min(4501) # => [3, 1]
      - 4501.divmod(1440) # => [3, 181]
        - 181.divmod(60) # => [3, 1]

  - (0..1440)
    - min_to_hour_n_min(0) # => [0, 0]
      - 0.divmod(60) # => [0, 0]
    - min_to_hour_n_min(1440) # => [0, 0]
      - 1440.divmod(60) # => [24, 0]
    - min_to_hour_n_min(50) # => [0, 50]
      - 50.divmod[60] # => [0, 50]

  - (-1440..0)
    - min_to_hour_n_min(-30) # => [23, 30]
      - -30.divmod(60) # => [-1, 30]
        - [(24-1), 30]
    - min_to_hour_n_min(-20) # => [23, 40]
      - -20.divmod(60) # => [-1, 40]
        - [(24-1), 40]
    - min_to_hour_n_min(-1440) # => [0, 0]
      - -1440.divmod(60) # => [-24, 0]
        - [(24-24), 0]

  - Less than -1440
    - min_to_hour_n_min(-4231) # => [1, 29]
      - -4321.divmod(1440) # => [-3, 89]
      - 89.divmod(60) # => [1, 29]

General
- IF input integer's absolute value > 1440
  - input.divmod(1440) # => [quotient, remainder]
  - remainder.divmod(60)
- ELSIF input integer's absolute value between 0 and 1440
  - input.divmod(60) # => [quotient, remainder]
    - IF input.positive?
      - [quotient, remainder]
    - ELSE
      - [24 + quotient, remainder]
=end

def min_to_hour_n_min(min)
  if min.abs > 1440
    (min % 1440).divmod(60)
  elsif min >= 0
    min.divmod(60)
  else
    [24 + min / 60, min % 60]
  end
end
=begin
p min_to_hour_n_min(0) == [0, 0]
p min_to_hour_n_min(30) == [0, 30]
p min_to_hour_n_min(60) == [1, 0]
p min_to_hour_n_min(-30) == [23, 30]
p min_to_hour_n_min(-45) == [23, 15]
p min_to_hour_n_min(-60) == [23, 0]
p min_to_hour_n_min(-800) == [10, 40]
p min_to_hour_n_min(800) == [13, 20]
p min_to_hour_n_min(-4231) == [1, 29]
p min_to_hour_n_min(4321) == [0, 1]
p min_to_hour_n_min(4501) == [3, 1]
=end
=begin
Second sub-problem:
Convert the numbers representing hour and minute into a string that represents
the corresponding time in the 24-hour format

PEDAC
P
Input:
- An array of two integers with the first representing the hour and the second
  representing the minute
Output:
- A string that represents the corresponding time of the input array in the
  24-hour format

E
p hour_n_min_to_str([0, 0]) == "00:00"
p hour_n_min_to_str([0, 30]) == "00:30"
p hour_n_min_to_str([1, 0]) == "01:00"
p hour_n_min_to_str([23, 30]) == "23:30"
p hour_n_min_to_str([23, 15]) == "23:15"
p hour_n_min_to_str([23, 0]) == "23:00"
p hour_n_min_to_str([10, 40]) == "10:40"
p hour_n_min_to_str([13, 20]) == "13:20"
p hour_n_min_to_str([1, 29]) == "01:29"
p hour_n_min_to_str([0, 1]) == "00:01"
p hour_n_min_to_str([3, 1]) == "03:01"

D
Input: An array of two integers
Output: A string

A
General
- Use string interpolation
- Initialize a var, hour, that points to first element of input array
- Initialize a var, min, that points to second element of input array
- IF hour < 10, then hour points to "0" + str of hour, ELSE just str of hour
- IF min < 10, then min points to "0" + str of min, ELSE just str of min
- Return "#{hour}:#{min}"
=end

def hour_n_min_to_str(hour_n_min)
  hour = hour_n_min[0] >= 10 ? hour_n_min[0].to_s : '0' + hour_n_min[0].to_s
  min = hour_n_min[1] >= 10 ? hour_n_min[1].to_s : '0' + hour_n_min[1].to_s
  "#{hour}:#{min}"
end
=begin
p hour_n_min_to_str([0, 0]) == "00:00"
p hour_n_min_to_str([0, 30]) == "00:30"
p hour_n_min_to_str([1, 0]) == "01:00"
p hour_n_min_to_str([23, 30]) == "23:30"
p hour_n_min_to_str([23, 15]) == "23:15"
p hour_n_min_to_str([23, 0]) == "23:00"
p hour_n_min_to_str([10, 40]) == "10:40"
p hour_n_min_to_str([13, 20]) == "13:20"
p hour_n_min_to_str([1, 29]) == "01:29"
p hour_n_min_to_str([0, 1]) == "00:01"
p hour_n_min_to_str([3, 1]) == "03:01"
=end

def time_of_day(min)
  hour_n_min_to_str(min_to_hour_n_min(min))
end

p time_of_day(0) # == "00:00"
p time_of_day(30) # == "00:30"
p time_of_day(60) # == "01:00"
p time_of_day(-30) # == "23:30"
p time_of_day(-45) # == "23:15"
p time_of_day(-60) # == "23:00"
p time_of_day(800) # == "13:20"
p time_of_day(-800) # == "10:40"
p time_of_day(-4231) # == "01:29"
p time_of_day(4321) # == "00:01"
p time_of_day(4501) # == "03:01"
p time_of_day(999999999)
