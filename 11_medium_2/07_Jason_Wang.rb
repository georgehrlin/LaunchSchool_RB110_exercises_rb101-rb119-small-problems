require 'date'

def five_fridays(year)
  Date.new(year).step(Date.new(year, -1, -1))
    .select(&:friday?)
    .group_by(&:month)
    .select { |_, fridays| fridays.length > 4}
    .keys
    .size
end

p five_fridays(2016) # == 5
