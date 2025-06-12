=begin
Problem 3

How would you approach this problem if you were allowed to use Ruby's Date and
Time classes and wanted to consider the day of week in your calculation?
(Assume that delta_minutes is the number of minutes before or after midnight
between Saturday and Sunday; in such a method, a delta_minutes value of -4231
would need to produce a return value of Thursday 01:29.)
=end

def time_of_day(delta_minutes)
  t = (Time.new(0, 1, 7) + (60 * delta_minutes))
  format('02d:02d', t.hour, t.min)
end

p time_of_day(0)
