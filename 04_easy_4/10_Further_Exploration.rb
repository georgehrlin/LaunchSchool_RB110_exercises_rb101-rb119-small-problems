# FURTHER EXPLORATION

# Refactor our solution to reduce the 3 integer_to_string calls to just one.

DIGITS = %w[0 1 2 3 4 5 6 7 8 9]

def integer_to_string(int)
  result = ''
  loop do
    int, remainder = int.divmod(10)
    result.prepend(DIGITS[remainder])
    break if int == 0
  end
  result
end

def signed_integer_to_string(num)
  case number <=> 0
  when -1 then "-#{integer_to_string(-num)}"
  when +1 then "+#{integer_to_string(num)}"
  else             integer_to_string(num)
  end
end

def signed_integer_to_string(num)
  result = integer_to_string(num.abs)
  result.prepend (
    case num <=> 0
    when +1 then '+'
    when -1 then '-'
    else         ''
    end)
  result
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

# By Tovi Newman
def signed_integer_to_string(int)
  ['', '+', '-'][int <=> 0] + integer_to_string(int.abs)
end
