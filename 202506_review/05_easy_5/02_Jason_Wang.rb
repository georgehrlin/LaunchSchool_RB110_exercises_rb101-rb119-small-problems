# FURTHER EXPLORATION
# Problem 3

require 'date'

def time_of_day(delta_minutes)
  ((Date.parse("Sunday")) + Rational(delta_minutes, 1440)).strftime("%A %H:%M")
end

p Date.parse("Sunday")
