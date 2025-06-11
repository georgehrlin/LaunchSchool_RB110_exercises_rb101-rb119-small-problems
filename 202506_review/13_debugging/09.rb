def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
    attempts += 1
    break if attempts > max_attempts

    input = nil
    until valid_integer?(input)
      print 'Make a guess: '
      input = gets.chomp
    end

    guess = input.to_i

    if guess == winning_number
      puts 'Yes! You win.'
      break
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big'    if guess > winning_number
    end
  end
end

guess_number(10, 3)

=begin
Without running the original code, I concluded that the program will continue
to prompt the user to keep guessing even if he guessed the right number and so
long as attempts is smaller than max_attempts. The loop from lines 9 to 30 is
missing a break condition when the correct number is guessed.

Once I did run the code, I realized another problem exists. When the user
makes a wrong guess, guess_number is called again on line 28. This results in
winning_number being reassigned a different number.

Line 28 is redundant because guess_number already contains a loop.
=end
