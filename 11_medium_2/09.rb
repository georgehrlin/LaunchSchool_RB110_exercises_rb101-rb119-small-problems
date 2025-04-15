=begin
Bubble Sort

Write a method that takes an Array as an argument, and sorts that Array using
the bubble sort algorithm as just described. Note that your sort will be
"in-place"; that is, you will mutate the Array passed as an argument. You may
assume that the Array contains at least 2 elements.
=end

=begin
PEDAC
P
Input:
- An arr of sortable elements
Output:
- The sorted input arr

E
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

D
Input: An arr
Output: The input arr

A
- "A bubble sort works by making multiple passes (iterations) through the
  Array. On each pass, each pair of consecutive elements is compared. If the
  first of the two elements is greater than the second, then the two elements
  are swapped. This process is repeated until a complete pass is made without
  performing any swaps; at that point, the Array is completely sorted."

- Initialize a swap_tracker to keep track of if a swap occured
- IF swap_tracker is true
  - Iterate over elements of input arr from idx 0 to idx -2
    - Compare ele at idx 0 with ele at idx 1
      - IF ele_1 < ele_0
        - Move ele_1 to idx 0 and ele_0 to idx 1
        - Set swap_tracker to true
    - Compare ele at idx 1 with ele at idx 2
    - And so on...
=end

=begin
def bubble_sort!(arr)
  loop do
    swapped_or_not = false
    (0...arr.size - 1).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped_or_not = true
      end
    end

    break if !swapped_or_not
  end
end
=end

=begin
FURTHER EXPLORATION

Note that we did not use the optimization suggested on the Wiki page that skips
looking at tail elements that we know are already sorted. If your solution also
skipped this optimization, try modifying your solution so it uses that
optimization.
=end

=begin
"The bubble sort algorithm can be optimized by observing that the n-th pass
finds the n-th largest element and puts it into its final place. So, the inner
loop can avoid looking at the last n-1 items when running for the n-th time."
=end

=begin
procedure bubbleSort(A : list of sortable items)
    n := length(A)
    repeat
        swapped := false
        for i := 1 to n - 1 inclusive do
            if A[i - 1] > A[i] then
                swap(A[i - 1], A[i])
                swapped := true
            end if
        end for
        n := n - 1
    until not swapped
end procedure
=end

=begin
def bubble_sort!(arr)
  nth_loop = 1

  loop do
    swapped_or_not = false

    (0...(arr.size - 1 - (nth_loop - 1))).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped_or_not = true
      end
    end

    break if !swapped_or_not
    nth_loop += 1
  end
end
=end

def bubble_sort!(arr)
  idx_last_to_check = arr.size - 1

  loop do
    swapped_or_not = false

    (0...idx_last_to_check).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        swapped_or_not = true
        idx_last_to_check = idx
      end
    end

    break if !swapped_or_not
  end
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]


array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
