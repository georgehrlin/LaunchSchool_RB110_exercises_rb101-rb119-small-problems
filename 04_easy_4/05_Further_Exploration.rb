=begin
FURTHER EXPLORATION

Investigate Enumerable.reduce. How might this method be useful in solving this
problem? (Note that Enumerable methods are available when working with Arrays.)
Try writing such a solution. Which is clearer? Which is more succinct?
=end
=begin
def multisum(max_val)
  multiples = (1..max_val).select { |num| num % 3 == 0 || num % 5 == 0 }
  multiples.inject(:+)
end
=end
def multisum(max_val)
  (1..max_val).inject(0) do |sum, num|
    if num % 3 == 0 || num % 5 == 0
      sum + num
    else
      sum + 0
    end
  end
end

p multisum(2)
p multisum(3) # == 3
p multisum(5) # == 8
p multisum(10) # == 33
p multisum(1000) # == 234168

=begin
A: The solutions without Enumerable.inject are simpler and more readable.
Using inject really is complicating the solution quite a bit, especially it
is so easy to make a mistake by forgetting to provide it with an initial
operand of 0.

Without the initial operand of 0, the sum would always be 1 more than the
correct sum, because in the first iteration of inject, 1 would be added to
the sum no matter what (without being checked if it is a multiple of 3 or 5).

On the other hand, using inject can work without an initial operand of 0; but
in this case, the range upon which inject is called must begin with 0, not 1.
=end
