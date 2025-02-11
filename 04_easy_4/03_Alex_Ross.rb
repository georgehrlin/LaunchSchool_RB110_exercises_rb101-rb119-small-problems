require 'date'

def leap_year?(year)
  Date.new(year, 1, 1, Date::GREGORIAN).leap?
end

# By Christina Unger
Date.gregorian_leap?(year)
