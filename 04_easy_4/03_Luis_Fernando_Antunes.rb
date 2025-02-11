def leap_year?(year)
  year % 100 == 0 ? year % 400 == 0 : year % 4 == 0
end
