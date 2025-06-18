def diamond(diamond_size)
  1.step(by: 2, to: diamond_size) do |n|
    puts ('*' * n).center(diamond_size)
  end

  (diamond_size - 2).step(by: -2, to: 1) do |n|
    puts ('*' * n).center(diamond_size)
  end
end
