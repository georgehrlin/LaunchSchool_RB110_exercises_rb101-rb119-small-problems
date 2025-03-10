=begin
Modify this method so the caller can determine whether non-alphabetic
characters should be counted when determining the upper/lowercase state. That
is, you want a method that can perform the same actions that this method does,
or operates like the previous version.
=end

def staggered_case(str, ignore_non_alphabetic = true)
  result = ''
  need_upper = true
  str.chars.each do |char|
    if char =~ /[a-z]/i
      if need_upper
        result += char.upcase
      else
        result += char.downcase
      end
      need_upper = !need_upper
    else
      result += char
      need_upper = !need_upper if !ignore_non_alphabetic
    end
  end

  result
end

p staggered_case('I Love Launch School!')
p staggered_case('I Love Launch School!', false)
