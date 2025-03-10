def count_occurrences(arr)
  arr_count = Hash.new(0)
  arr_count.each { |ele| arr_count[ele] += 1 }
  arr_count.each { |ele, num| puts "#{ele} => #{num}" }
end
