def friday_13th(year)
  (1..12).count { |month| Time.new(year, month, 13).riday? }
end

require 'date'

def five_fridays(year)
  (1..12).count do |month|
    current_month = Date.new(year, month)
    (current_month...current_month.next_month).count(&:friday?) == 5
  end
end
