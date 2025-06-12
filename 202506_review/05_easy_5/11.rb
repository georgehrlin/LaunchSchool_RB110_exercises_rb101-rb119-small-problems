def digit_list(n)
  n.to_s.split('').map { |n_str| n_str.to_i }
end

# OFFICIAL SOLUTION
def digit_list(n)
  n.to_s.chars.map(&:to_i)
end
