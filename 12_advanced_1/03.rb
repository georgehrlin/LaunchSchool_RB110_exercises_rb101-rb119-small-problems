=begin
Transpose 3x3

Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns
the transpose of the original matrix.

Take care not to modify the original matrix: you must produce a new matrix and
leave the original matrix unchanged.
=end

=begin
PEDAC
P
Input:
- A one-level three-item nested array that represents a 3-by-3 matrix
Output:
- A one-level three-item nested array that is the transposed input matrix

E
matrix = [
[1, 5, 8],
[4, 7, 2],
[3, 9, 6]
]

transpose(matrix)
# => [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

D
Input: A one-level three-item nested array
Output: A one-level three-item nested array

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

- Return a new nested arr
  - The first and second indices of each sub-element of the new arr are the
    original indices swapped
=end

def transpose(original_matrix)
  #new_matrix = Array.new(3, [])
  # NOTE: This doesn't work because it initiates a new array with three element
  # references that all point to the same arr.
  new_matrix = [[], [], []]

  original_matrix.each_with_index do |subarr, subarr_idx|
    subarr.each_with_index do |ele, ele_idx|
      new_matrix[ele_idx][subarr_idx] = ele
    end
  end

  new_matrix
end

matrix = [
[1, 5, 8], # => [1, 4, 3]
[4, 7, 2], # => [5, 7, 9]
[3, 9, 6]  # => [8, 2, 6]
]

p transpose(matrix)
# => [[1, 4, 3], [5, 7, 9], [8, 2, 6]]

=begin
# OFFICIAL SOLUTION
def transpose(matrix)
  result = []
  (0..2).each do |column_index|
    new_row = (0..2).map { |row_index| matrix[row_index][column_index] }
    restul << new_row
  end
  result
end
=end
