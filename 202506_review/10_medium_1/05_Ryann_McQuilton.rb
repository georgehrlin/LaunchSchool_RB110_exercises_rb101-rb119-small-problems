def diamond(n)
  stars = 1

  1.upto(n) do |line|
    puts ('*' * stars).center(n)
    line > (n / 2) ? stars -= 2 : stars += 2
  end
end

diamond(5)
