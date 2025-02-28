=begin
Alphabetical Numbers

Write a method that takes an Array of Integers between 0 and 19, and returns an
Array of those Integers sorted based on the English words for each number:

zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven,
twelve, thirteen, fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

Example:
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

=begin
PEDAC
P
Input:
- An array of integers. Integers are between 0 and 19, inclusive
Output:
- An array of the same intgers, but sorted based the alphabetical order of the
  English words of those integers

E
alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]

D
Input: An array of integers
Intermediary: Potentially a hash with ints as keys and strs as vals
Output: An array of integers

A
General
- Convert input arr of ints to arr of the English words of those ints
- Sort new arr based on alphabetical order
- Convert arr of English words back to arr of respective ints
=end

NUM_TO_ENGLISH = {
  0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
  6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
  11 => 'eleven',  12 => 'twelven', 13 => 'thirteen', 14 => 'fourteen',
  15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
  19 => 'ninetteen'
}

def alphabetic_number_sort(nums)
  nums.map { |num| NUM_TO_ENGLISH[num] }
      .sort
      .map { |word| NUM_TO_ENGLISH.key(word) }
end

p alphabetic_number_sort((0..19).to_a)

# OFFICIAL SOLUTION
NUMBER_WORDS = %W[zero one two three four five six seven eight nine ten eleven
                  twelve thirteen fourteen fifteen sixteen seventeen eighteen
                  nineteen]

def alphabetic_number_sort(nums)
  nums.sort_by { |num| NUMBER_WORDS[num] }
end

=begin
FURTHER EXPLORATION

Q: Why do you think we didn't use Array#sort_by! instead of Enumerable#sort_by?

A: I think it's beacuse we are asked by the original question to come up with a
method that "takes an Array ... and returns an Array", which implies that the
method should return a new array object.
=end
