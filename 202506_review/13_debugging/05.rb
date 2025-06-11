cards = [2, 3, 4, 5, 6, 7, 8, 9, 10, :jack, :queen, :king, :ace]

deck = { :hearts   => cards.dup,
         :diamonds => cards.dup,
         :clubs   => cards.dup,
         :spades   => cards.dup }

deck.each { |_, cards| puts cards.object_id }

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

p player_cards
p deck
puts sum

=begin
The faulty original code produces a TypeError because of line 30. The purpose
of lines 30 to 32 is to transform the array of remaining cards into an array
cards scores. Line 30 successfully transforms the array of cards but fails to
reassign the variable remaining_cards to the returned array of card scores. We
can also fix this issue by using the destructive method map! instead.

Once the first issue is fixed, the program still produces a faulty sum. This is
because all of the suits contain contain the same array of cards. When one
random card is picked from a suit, that card is in fact picked from all of the
suits. To fix this issue, each suit must be assigned a different, independent
array of cards.
=end
