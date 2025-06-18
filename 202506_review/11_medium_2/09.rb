def bubble_sort_1!(arr)
  loop do
    exchanged = false
    i = 0
    while i < arr.size - 1
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        exchanged = true
        i += 1
      else
        i += 1
      end
    end

    break if exchanged == false
  end
end

# After LSBot's review
def bubble_sort_2!(arr)
  loop do
    swapped = false
    0.upto(arr.size - 2) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end

    break if swapped == false
  end
end

# FURTHER EXPLORATION
# Wikipedia: Optimizing bubble sort 1
def bubble_sort_3!(arr)
  n = arr.size - 2
  loop do
    swapped = false
    0.upto(n) do |i|
      if arr[i] > arr[i + 1]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
        swapped = true
      end
    end
    n -= 1

    break if swapped == false
  end
end

# Wikipedia: Optimizing bubble sort 2
def bubble_sort_3!(arr)
  n = arr.size
  loop do
    newn = 0
    (1..(n-1)).each do |i|
      if arr[i - 1] > arr[i]
        arr[i - 1], arr[i] = arr[1], arr[i - 1]
        newn = i
      end
    end
    n = newn
    break if n <= 1
  end
end

require 'benchmark'

arr = [30, 29, 28, 27, 26, 25, 24, 23, 22, 21, 20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

Benchmark.bm do |x|
  x.report('1') {bubble_sort_1!(arr)}
  x.report('2') {bubble_sort_2!(arr)}
  x.report('3') {bubble_sort_3!(arr)}
end

# arr = [20, 19, 18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1]

# bubble_sort_1!(arr)
# p arr
# 
# bubble_sort_2!(arr)
# p arr
# 
# bubble_sort_3!(arr)
# p arr
