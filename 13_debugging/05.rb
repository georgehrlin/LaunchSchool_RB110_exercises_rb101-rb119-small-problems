=begin
Card Deck

We started working on a card game but got stuck. Check out why the code below
raises a TypeError.

Once you get the program to run and produce a sum, you might notice that the
sum is off: It's lower than it should be. Why is that?
=end

cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards,
         :diamonds => cards,
         :clubs    => cards,
         :spades   => cards }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map do |card|
    score(card)
  end

  sum += remaining_cards.sum
end

puts sum

=begin
This code raises a TypeError because of errors in the block for reduce from
line 29 to line 35. The intention of calling reduce on deck is to calculate the
sum of the entire deck by finding and adding the sum of the remaining cards in
each suit. However, on line 34, remaining_cards still points to an array
that contains integers and symbols, so calling sum on this array raises a
TypeError. Lines 30 to 32 are intended to convert the symbols in
remaining_cards to corresponding scores (integers), so sum can be directly
called on remaining_cards; but because map is not a mutating method, it returns
an array of the scores of the remaining cards in each suit and the original
code fails to store this array for later processing.

To fix this TypeError issue, simply use map! on line 30 instead of map.

The final sum is off because of how the data of the cards in the deck are
structured. The problem with how the deck is initialized (from line 3 to 6) is
that each suit contains the same set of card objects. Therefore, whenever a
card is removed from a suit on line 24, that same card is also removed from all
the other suits.

To fix this faulty sum issue, we can initialize each suit of the deck
explicitly.
=end

=begin
CORRECTION

To be more clear with the second issue: In the original faulty code, the suits
in the deck all point to the same array. To fix the issue, the suits must be
different arrays with different reference slots, even though the references can
be the same (pointing to the same integers and symbols.)

ChatGPT 4o:
To be more precise about the second issue:
In the original faulty code, all the suits in the deck hash point to the same
array object. This means that removing a cards from one suit also affects all
other suits, since they share the reference to the same array.

To fix this, each suit be must assigned a distinct array — that is, an array
with its own reference slots. The elements in those arrays (integers and
symbols) can still be the same immutable objects, but they key is that the
outer arrays themselves must not be shared.
=end

=begin
# A better way to solve the second issue
cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs    => cards.dup,
         :spades   => cards.dup }
=end

# Fix
deck = { :hearts   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :diamonds => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :clubs    => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace],
         :spades   => [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace] }

def score(card)
  case card
  when :ace   then 11
  when :king  then 10
  when :queen then 10
  when :jack  then 10
  else card
  end
end

# Pick one random card per suit

player_cards = []
deck.keys.each do |suit|
  cards = deck[suit]
  cards.shuffle!
  player_cards << cards.pop
end

# Determine the score of the remaining cards in the deck

sum = deck.reduce(0) do |sum, (_, remaining_cards)|
  remaining_cards.map! do |card|
    score(card)
  end

  sum += remaining_cards.sum
end

puts sum
