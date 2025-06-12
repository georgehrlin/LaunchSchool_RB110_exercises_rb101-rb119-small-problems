=begin
The % operator's interaction with negative values is confusing and difficult to
remember, as described in the Introduction to Programming with Ruby Book.
Because of that, we recommend not using % with negative numbers, but that you
should first convert the negative values to positive numbers so you can write
more explicit code. This problem is one such place where it's probably easier
to take this approach.

However, that doesn't mean you can't use % at all. In fact, it's possible to
write a single calculation with % that performs the entire normalization
operation in one line of code. Give it a try, but don't spend too much time on
it.
=end

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = HOURS_PER_DAY * MINUTES_PER_HOUR

=begin
# Original
def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end
=end

def normalize_minutes_to_0_through_1439(minutes)
  minutes % MINUTES_PER_DAY
end

normalize_minutes_to_0_through_1439(0) # => 0
normalize_minutes_to_0_through_1439(30) # => 30
normalize_minutes_to_0_through_1439(60) # => 60
normalize_minutes_to_0_through_1439(-30) # => 1430
normalize_minutes_to_0_through_1439(-60) # => 1380
normalize_minutes_to_0_through_1439(50) # => 50
normalize_minutes_to_0_through_1439(-50) # => 1390
normalize_minutes_to_0_through_1439(4321) # => 1
normalize_minutes_to_0_through_1439(-4321) # => 1439
normalize_minutes_to_0_through_1439(4501) # => 181
normalize_minutes_to_0_through_1439(-4501) # => 1259
