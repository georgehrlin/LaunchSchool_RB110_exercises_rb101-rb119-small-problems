=begin
Problem 2

How would you approach this problem if you were allowed to use Ruby's Date
and Time classes?
=end

=begin
NOTE

I am not familiar with Ruby's Date and Time classes whatsoever. I looked into
the Time class and came up with the not-so-elegant solution below.

"It ain't much but it's honest work."
=end

def time_of_day(delta_minutes)
  t = (Time.new(0) + (60 * delta_minutes))
  format('02d:02d', t.hour, t.min)
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"
