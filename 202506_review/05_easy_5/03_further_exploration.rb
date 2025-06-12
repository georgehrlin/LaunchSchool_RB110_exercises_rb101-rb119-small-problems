=begin
FURTHER EXPLORATION

How would these methods change if you were allowed to use the Date and Time
classes?
=end
require 'time'

MIN_PER_H = 60
H_PER_DAY = 24
MIN_PER_DAY = MIN_PER_H * H_PER_DAY

def after_midnight(time)
  t = Time.parse(time)
  t.hour * MIN_PER_H + t.min
end

=begin
def before_midnight(time)
  t = Time.parse(time)
  MIN_PER_DAY - t.hour * MIN_PER_H - t.min == MIN_PER_DAY ? 0 : MIN_PER_DAY - t.hour * MIN_PER_H - t.min
end
=end

def before_midnight(time)
  MIN_PER_DAY - after_midnight(time) == MIN_PER_DAY ? 0 : MIN_PER_DAY - after_midnight(time)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
