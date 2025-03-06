def halvsies(arr)
  arr.partition.with_index { |ele, idx| idx < (arr.size / 2.0).ceil }
end
