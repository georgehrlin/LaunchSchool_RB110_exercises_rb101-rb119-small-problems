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
  case num <=> 0
  when -1 then "-#{integer_to_string(-num)}"
  when +1 then "+#{integer_to_string(num)}"
  else             integer_to_string(num)
  end
end
