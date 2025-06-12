MIN_PER_H = 60
H_PER_DAY = 24
MIN_PER_DAY = MIN_PER_H * H_PER_DAY

def after_midnight(time)
  h = time.split(':').first.to_i
  m = time.split(':').last.to_i

  h * MIN_PER_H + m == MIN_PER_DAY ? 0 : h * MIN_PER_H + m
end

def before_midnight(time)
  h = time.split(':').first.to_i
  m = time.split(':').last.to_i

  MIN_PER_DAY - h * MIN_PER_H - m == MIN_PER_DAY ? 0 : MIN_PER_DAY - h * MINUTES_PER_HOUR - m
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0
