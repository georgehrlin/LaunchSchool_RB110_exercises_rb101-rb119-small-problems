def min_to_hour_n_min(min)
  if min.abs > 1440
    (min % 1440).divmod(60)
  elsif min >= 0
    min.divmod(60)
  else
    [24 + min / 60, min % 60]
  end
end

def hour_n_min_to_str(hour_n_min)
  hour = hour_n_min[0] >= 10 ? hour_n_min[0].to_s : '0' + hour_n_min[0].to_s
  min = hour_n_min[1] >= 10 ? hour_n_min[1].to_s : '0' + hour_n_min[1].to_s
  "#{hour}:#{min}"
end

def time_of_day(min)
  hour_n_min_to_str(min_to_hour_n_min(min))
end
