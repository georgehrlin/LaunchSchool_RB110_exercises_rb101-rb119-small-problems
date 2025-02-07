(2..98).step(2) { |num| puts num }

(2..98).%(2) { |num| puts num }

(1..49).each { |num| puts (num * 2) }

puts (1..99).select { |num| num.even? }

puts (1..99).select(&:even?)

1.upto(99) { |num| puts num if num.even? }

1.upto(49) { |num| puts (num * 2) }

49.times { |num| puts ((num + 1) * 2) }
