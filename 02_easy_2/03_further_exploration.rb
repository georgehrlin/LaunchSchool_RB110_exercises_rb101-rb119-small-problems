=begin
Further Exploration
Our solution prints the results as $30.0 and $230.0 instead of the more usual
$30.00 and $230.00. Modify your solution so it always prints the results with 2
decimal places.

Hint: You will likely need Kernel#format for this.
=end
print 'What is the bill? '
bill = gets.to_f

print 'What is the tip percentage? '
tip_percentage = gets.to_f

tip_amount = bill * (tip_percentage / 100)
total = bill + tip_amount

puts format "The tip is $%.2f", tip_amount
puts format "The total is $%.2f", total
