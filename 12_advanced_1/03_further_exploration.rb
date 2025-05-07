=begin
Write a transpose! method that transposes a matrix in place. The obvious
solution is to reuse transpose from above, then copy the results back into the
array specified by the argument. For this method, don't use this approach;
write a method from scratch that does the in-place transpose.
=end

=begin
PEDAC
P
Input:
- A one-level three-item nested array that represents a 3-by-3 matrix
Output:
- The same one-level three-item nested array but the matrix elements are
  transposed

E
matrix = [
[1, 5, 8],
[4, 7, 2],
[3, 9, 6]
]

transpose(matrix)

matrix
# => [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

D
Input: A one-level three-item nested array
Output: The same one-level three-item nested array

A
- old[0][0] -> new[0][0]
- old[0][1] -> new[1][0]
- old[0][2] -> new[2][0]

- old[1][0] -> new[0][1]
- old[1][1] -> new[1][1]
- old[1][2] -> new[2][1]

- old[2][0] -> new[0][2]
- old[2][1] -> new[1][2]
- old[2][2] -> new[2][2]

- Exchange the following pairs of elements with the following sets of indices
  - 0 1 with 1 0
  - 0 2 with 2 0
  - 1 2 with 2 1

=end

def transpose!(matrix)
  matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
  matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
  matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
end

matrix = [
[1, 5, 8], # => [1, 4, 3]
[4, 7, 2], # => [5, 7, 9]
[3, 9, 6]  # => [8, 2, 6]
]

transpose!(matrix)

p matrix
# => [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
