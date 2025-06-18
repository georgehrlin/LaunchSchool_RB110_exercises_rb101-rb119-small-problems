def diamond(n)
  [*(1...n), *n.downto(1)].each do |i|
    puts ('*' * n).center(n) if i.odd?
  end
end
