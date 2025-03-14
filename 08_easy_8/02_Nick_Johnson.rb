def leading_substrings(string)
  string.size <= 1 ? [string] : [*leading_substrings(string.chop), string]
end
