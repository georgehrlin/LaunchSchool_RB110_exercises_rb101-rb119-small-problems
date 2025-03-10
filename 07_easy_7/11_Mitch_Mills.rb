def count_occurrences(arr)
  arr.map(&:downcase).tally.each { |k, v| puts "#{k} => #{v}" }
end

vehicles = [
  'car', 'car', 'truck', 'CAR', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'TRUCK'
]

count_occurrences(vehicles)
