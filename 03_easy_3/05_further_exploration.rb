=begin
FURTHER EXPLORATION

What if we wanted to generalize this method to a "power to the n" type method:
cubed, to the 4th power, to the 5th, etc. How would we go about doing so while
still using the multiply method?
=end

def multiply(num1, num2)
  num1 * num2
end

=begin
DRAFT

Say n is 3
3**2, 2 times, multiply(3, 3)
3**3, 3 times, multiply(multiply(3, 3), 3)
3**4, 4 times, multiply(multiply(multiply(3, 3), 3) 3)
etc.
=end
=begin
def exponentiate(num, power)
  result = num
  (power - 1).times do
    result = multiply(result, num)
  end
  result
end

p exponentiate(3, 3)
p exponentiate(2, 5)
p exponentiate(4, 3)
=end
# By Caleb
def power_of(num, power)
  if power == 0
    1
  else
    return multiply(num, power_of(num, power - 1))
  end
end
