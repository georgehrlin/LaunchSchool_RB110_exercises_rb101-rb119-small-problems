MINUTES_PER_HOUR = 60
MINUTES_PER_DAY = 1440

def hours_to_minutes(time)
  time[0..1].to_i * MINUTES_PER_HOUR
end

def minutes(time)
  time[3..4].to_i
end

def after_midnight(time)
  (hours_to_minutes(time) + minutes(time)) % MINUTES_PER_DAY
end

def before_midnight(time)
  (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
end
