=begin
FURTHER EXPLORATION

In our solution, we call string[1..-1] twice, and call string_to_integer three
times. This is somewhat repetitive. Refactor our solution so it only makes
these two calls once each.
=end

DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  value = 0
  string.chars.each { |char| value = 10 * value + DIGITS[char] }
  value
end

def string_to_signed_integer(string)
  str_val = string.delete('^0-9')
  val_absolute = string_to_integer(str_val)
  string[0] == '-' ? -val_absolute : val_absolute
end

p string_to_signed_integer('4321') # == 4321
p string_to_signed_integer('-570') # == -570
p string_to_signed_integer('+100') # == 100
