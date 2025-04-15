def letter_percentages(str)
  hsh = { lowercase: 'a-z', uppercase: 'A-Z', neither: '^a-zA-Z'}

  hsh.transform_values do |regex|
    (str.count(regex) * 100.0 / str.size).round(1)
  end
end
