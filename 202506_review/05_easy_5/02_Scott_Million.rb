HOURS = ('00'..'23').to_a
MINUTES = ('00'..'59').to_a

def time_of_day(minutes)
  "#{HOURS[minutes / 60 % 24]}:#{MINUTES[minutes % 60]}"
end

p time_of_day(0) # == "00:00"
p time_of_day(-3) # == "23:57"
p time_of_day(35) # == "00:35"
p time_of_day(-1437) # == "00:03"
p time_of_day(3000) # == "02:00"
p time_of_day(800) # == "13:20"
p time_of_day(-4231) # == "01:29"

p HOURS
p MINUTES
