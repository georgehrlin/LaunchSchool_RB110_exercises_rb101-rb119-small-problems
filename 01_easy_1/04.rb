=begin
What's my Bonus?
Write a method that takes two arguments, a positive integer and a boolean, and
calculates the bonus for a given salary. If the boolean is true, the bonus
should be half of the salary. If the boolean is false, the bonus should be 0.

Examples:
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

PEDAC
P
Input: An integer representing salary and a boolean value representing if there
       will be bonus
Output: An integer representing the amount of bonus. If there is bonus, it is
        half of the salary integer input
Explicit:
- If input boolean value is false, bonus is 0

E
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

D
Input: An integer and a boolean
Output: An integer

A
- If input boolean value is true
  - Return half of input integer value
- Else
  - Return 0
=end

def calculate_bonus(salary, bonus_status)
  if bonus_status
    salary / 2
  else
    0
  end
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

# OFFICIAL SOLUTION
def calculate_bonus(salary, bonus)
  bonus ? (salary / 2) : 0
end
