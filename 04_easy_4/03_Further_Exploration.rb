# Q: For what years will leap_year? fail if you rewrite it as:
def leap_year?(year)
  if year % 100 == 0
    false
  elsif year % 400 == 0
    true
  else
    year % 4 == 0
  end
end

# A: With this version of leap_year?, the years that are evenly divisible by
# 100 and 400 will fail, because years evenly divisible by 400 are also evenly
# divisible by 100, so those years will never make it to the second branch of
# the if statement.

=begin
Q: Can you rewrite leap_year? to perform its tests in the opposite order of the
above solution? That is, test whether the year is divisible by 4 first, then,
if necessary, test whether it is divisible by 100, and finally, if necessary,
test whether it is divisible by 400. Is this solution simpler or more complex
than the original solution?
=end

def leap_year?(year)
  if year % 4 == 0 && year % 100 != 0
    true
  elsif year % 400 == 0
    true
  else
    false
  end
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true