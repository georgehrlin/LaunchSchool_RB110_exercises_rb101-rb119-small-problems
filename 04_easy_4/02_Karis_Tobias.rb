def century(year)
  century = (year.to_f / 100).ceil.to_s

  if century.end_with?('1') && !(century.end_with?('11'))
    century << 'st'
  elsif century.end_with?('2') && !(century.end_with?('12'))
    century << 'nd'
  elsif century.end_with?('3') && !(century.end_with?('13'))
    century << 'rd'
  else
    century << 'th'
  end
end
