=begin
FURTHER EXPLORATION

How come our solution passes word into the swap_first_last_characters method
invocation instead of just passing the characters that needed to be swapped?
Suppose we had this implementation:

def swap_first_last_characters(a, b)
  a, b = b, a
end

and called the method like this:
swap_first_last_characters(word[0], word[-1])

Would this method work? Why or why not?
=end

=begin
In the supposed implementation, the method would fail to swap the first and
last characters of the input string. What the supposed method does is it only
swaps what the parameters a and b point to within the method. Also, what gets
returned by the supposed method is an array consisting of the first and last
characters, not the input string with its first and last characters swapped.

To mutate the input string by swapping its first and last characters, the
string itself would have to be passed in as argument to the method. Other than
the problem with methods' self-contained scope, as the only way for the method
to gain access to the string data is by having it passed in, when word[0] and
word[-1] are passed in as arguments, they are new single-character strings.
The method would have no access to the original string and thus no way to
mutate it.
=end

# Testing
def swap_first_last_characters(a, b)
  a, b = b, a
end

word = 'abcd'
p swap_first_last_characters(word[0], word[-1])
p word
