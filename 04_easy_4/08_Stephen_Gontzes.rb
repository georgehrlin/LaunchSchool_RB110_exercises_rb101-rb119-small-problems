DIGITS = {
  '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9
}

def string_to_integer(string)
  value = 0
  string.chars.each { |char| value = 10 * value + DIGITS[char] }
  value
end

def string_to_signed_integer(str)
  sign = str[0] == '-' ? -1 : 1
  str.delete!('+-')
  string_to_integer(str) * sign
end

p string_to_signed_integer('4321') # == 4321
p string_to_signed_integer('-570') # == -570
p string_to_signed_integer('+100') # == 100
