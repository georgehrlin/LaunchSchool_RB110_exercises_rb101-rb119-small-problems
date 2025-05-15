def divide_iterative_with_structure(arr)
  return arr if arr.size == 1

  stack = []
  root_frame = {
    array: arr,
    state: :start,
    left_result: nil,
    right_result: nil,
    parent: nil,
    side: nil
  }

  current = root_frame

  result = nil

  loop do
    if current[:array].size == 1
      if current[:parent]
        current[:parent][:"#{current[:side]}"]
      end
    end
  end
end
