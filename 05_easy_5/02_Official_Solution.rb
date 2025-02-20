MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR
=begin
def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end
=end
# Testing Further Exploration 1 solution
def normalize_minutes_to_0_through_1439(minutes)
  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

=begin
Format Specifications
Precision Specifier
A precision specifier is a decimal point followed by zero or more decimal
digits.
For integer type specifiers, the precision specifies the minimum number of
digits to be written. If the precision is shorter than the integer, the result
is padded with leading zeros. There is no modification or truncation of the
result if the integer is longer than the precision.
=end

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