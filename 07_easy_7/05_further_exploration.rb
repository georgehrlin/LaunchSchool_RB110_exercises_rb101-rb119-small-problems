=begin
Can you modify this method so the caller can request that the first character
be downcased rather than upcased? If the first character is downcased, then the
second character should be upcased, and so on.

Hint: Use a keyword argument.
=end

def staggered_case(string, first_char_up = 'true')
  result = ''
  need_upper = first_char_up ? true : false
  string.chars.each do |char|
    if need_upper
      result << char.upcase
    else
      result << char.downcase
    end
    need_upper = !need_upper
  end

  result
end

p staggered_case('I Love Launch School!', false) # == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS', false) # == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers', false) # == 'IgNoRe 77 ThE 444 NuMbErS'
