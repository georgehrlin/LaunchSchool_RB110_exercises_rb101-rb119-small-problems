=begin
Number Guessing Game

A friend of yours wrote a number guessing game. The first version he shows you
picks a random number between 1 and a provided maximum number and offers you a
given number of attempts to guess it.

However, when you try it, you notice that it's not working as expected. Run the
code and observe its behavior. Can you figure out what is wrong?
=end

=begin
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
    else
      puts 'Nope. Too small.' if guess < winning_number
      puts 'Nope. Too big.'   if guess > winning_number

      # Try again:
      guess_number(max_number, max_attempts)
    end
  end
end

guess_number(10, 3)
=end

=begin
Without running the faulty code, I see there are a few problems with the code:
1. The break condition of the loop inside guess_number should be moved to the
   end of the method definition. Otherwise, if max_attempts is 1, the player
   would not even get to have the one attempt to guess the number first before
   the loop is broken out of.
2. The recursion of guess_number lacks a proper stopping condition. With the
   faulty code, the game continues regardless of whether the player guesses the
   right number. There should be a stop once the player makes the correct
   guess. Also, the break statement on line 11 does not function properly as a
   stopping condition because attempts is always reset back to 0 whenever
   guess_number is called again on line 28 (not to mention that the
   winning_number is also set to a different one). And line 28 will always be
   reached, causing the game to conitnue infinitely.
=end

=begin
ADDENDUM

I didn't see that the original code does not have an end keyword on line 26 to
close the if statements before line 28.

A more precise diagnosis of the faulty code should be:
1. Lines 10 and 11 should still be moved to the end of guess_number in case
   max_attempts is 1.
2. When the user makes a correct guess, the game still continues because that
   branch of the if statement is missing a break keyword.
3. When the user makes an incorrect guess, the game resets by calling itself
   recursively. This is unnecessary because the if statement is already
   contained in a loop.
=end

# FIX
def valid_integer?(string)
  string.to_i.to_s == string
end

def guess_number(max_number, max_attempts)
  winning_number = (1..max_number).to_a.sample
  attempts = 0

  loop do
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
      puts 'Nope. Too big.'   if guess > winning_number
    end

    attempts += 1

    if attempts == max_attempts
      puts 'You have reached the max attempts!'
      break
    end
  end
end

guess_number(10, 3)
