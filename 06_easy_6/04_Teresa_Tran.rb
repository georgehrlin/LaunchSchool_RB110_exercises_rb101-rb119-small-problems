def reverse!(array)
  array.size.times do |i|
    array.insert(i, array.pop)
  end

  array
end
