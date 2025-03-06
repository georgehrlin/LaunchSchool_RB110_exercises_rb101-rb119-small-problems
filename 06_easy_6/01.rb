=begin
Cute angles

Write a method that takes a floating point number that represents an angle
between 0 and 360 degrees and returns a String that represents that angle in
degrees, minutes and seconds. You should use a degree symbol (°) to represent
degrees, a single quote (') to represent minutes, and a double quote (") to
represent seconds. A degree has 60 minutes, while a minute has 60 seconds.

Note: You can use the following constant to represent the degree symbol:
DEGREE = "\u00B0"

Examples:
# All test cases should return true
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values, but
should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes
and seconds, e.g., 321°03'07".
=end

=begin
PEDAC
P
Input:
- A float that represents an angle between 0 and 360 degrees
Output:
- A str that represents the input angle in degrees, minutes, and seconds
  - A degree symbol (°) to represent degrees, a single quote (') to represent
    minutes, and a double quote (") to represent seconds
  - A degree has 60 minutes, while a minute has 60 seconds

E
puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) == %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

D
Input: A float
Output: A str

A
- The degrees portion's value can be translated directly
- If decimals exist
  - Multiply input float's decimals by 60 to find minutes
  - Multiply the decimals of minutes by 60 to find seconds
    - Then only take the ones value

- Use Kernel#format to construct the final str
=end

DEGREE = "\u00B0"

def dms(angle)
  minutes = angle.remainder(1) * 60
  seconds = minutes.remainder(1) * 60
  format("%d%s%02d'%02d\"", angle, DEGREE, minutes, seconds)
end

p dms(76.73)

=begin
p dms(30) == %(30°00'00")
p dms(76.73) == %(76°43'48")
p dms(254.6) == %(254°36'00")
p dms(93.034773) == %(93°02'05")
p dms(0) == %(0°00'00")
p dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
=end

# OFFICIAL SOLUTION
DEGREE = "\u00B0"
MINUTES_PER_DEGREE = 60
SECONDS_PER_MINUTE = 60
SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE

def dms(degrees_float)
  total_seconds = (degrees_float * SECONDS_PER_DEGREE).round
  degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
  minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end
