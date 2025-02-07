=begin
Tip calculator
Create a simple tip calculator. The program should prompt for a bill amount and
a tip rate. The program must compute the tip and then display both the tip and
the total amount of the bill.

Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

=begin
PEDAC
P
Input:
1. An integer that represents the total bill amount
2. A number that represents the tip percentage
Output:
1. An output of an interpolated string with the tip amount
2. An output of an interpolated string with the total bill amount

E
Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

D
Input:
1. An integer
2. An integer
Output:
1. An output of a string with a float interpolated
2. An output of a string with a float interpolated

A
- Prompt user to enter bill amount
- Save user input in a var, bill
- Prompt user to enter tip percentage
- Save user input in a var, tip_percentage
- Calculate tip amount and save it to a var, tip_amount
- Calculate total and save it to a var, total
- Output tip amount in an interpolated string
- Output total amount in an interpoalted string
=end

=begin
print 'What is the bill? '
bill = gets.to_f
print 'What is the tip percentage? '
tip_percentage = gets.to_f
tip_amount = (bill * (tip_percentage / 100)).round(1)
total = (bill + tip_amount).round(1)
puts "The tip is $#{tip_amount}"
puts "The total is $#{total}"
=end

# OFFICIAL SOLUTION
print 'What is the bill? '
bill = gets.chomp
bill = bill.to_f

print 'What is the tip percentage? '
percentage = gets.chomp
percentage = percentage.to_f

tip   = (bill * (percentage / 100)).round(2)
total = (bill + tip).round(2)

puts "The tip is $#{tip}"
puts "The total is $#{total}"
