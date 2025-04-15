def featured(n)
  n += 1
  n += 1 until n.odd? && n % 7 == 0

  loop do
    n_chars = n.to_s.chars
    return n if n_chars.uniq == n_chars
    n += 14 # Because n += 7 would be even
    break if n >= 9876543210
  end

  'There is no possible number that fulfills those requirements.'
end

# Using regex to check for duplicate digits (credit: Grant Reed)
def featured(n)
  n += 1
  n += 1 until n.odd? && n % 7 == 0

  loop do
    return n if n.to_s.scan(/(\d)\d*\1/).empty?
    n += 14
    break if n >= 9876543210
  end
end
