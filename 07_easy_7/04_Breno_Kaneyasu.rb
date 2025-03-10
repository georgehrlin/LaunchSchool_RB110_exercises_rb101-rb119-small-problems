def swapcase(string)
  string.chars.map do |char|
    char == char.downcase ? char.upcase : char.downcase
  end
  .join
end

p swapcase('PascalCase') # == 'pASCALcASE'
p swapcase('Tonight on XYZ-TV') # == 'tONIGHT ON xyz-tv'
