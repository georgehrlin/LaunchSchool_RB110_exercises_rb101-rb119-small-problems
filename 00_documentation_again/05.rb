a = %w(a b c d e)
#puts a.fetch(7)                      # Output: IndexError
puts a.fetch(7, 'beats me')          # Output: beats me
puts a.fetch(7) { |index| index**2 } # Output: 14
