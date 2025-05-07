=begin
Transpose MxN

Modify your transpose method from the previous exercise so it works with any
matrix with at least 1 row and 1 column.
=end

=begin
PEDAC
P
Input:
- An array that represents a matrix that is at least 1 row and 1 column
Output:
- An array that is the input array transposed, columns and rows switched

E
transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
transpose([[1]]) == [[1]]

D
Input: An arr, could be nested
Output: An arr, could be nested

A
Analysis
- First-level subarrs represent cols
  - When iterating over cols, create new rows
- Eles within subarrs represent rows
  - When iterating over rows, create new cols

- Iterate over the subarrs of input arr with idx
  - Iterate over the eles of each sub-arr with idx
    - Assign ele to new_matrix[ele_idx][subarr_idx]
- Return new_matrix
=end

def transpose(matrix)
  new_matrix = []
  matrix[0].size.times { new_matrix << [] }

  matrix.each_with_index do |subarr, subarr_idx|
    subarr.each_with_index do |ele, ele_idx|
      new_matrix[ele_idx][subarr_idx] = ele
    end
  end

  new_matrix
end

# OFFICIAL SOLUTION
def transpose(matrix)
  result = []
  number_of_rows = matrix.size
  number_of_columns = matrix.first.size

  (0...number_of_columns).each do |column_index|
    new_row = (0...number_of_rows).map { |row_index| matrix[row_index][column_index] }
    result << new_row
  end

  result
end

=begin
FURTHER EXPLORATION

Some of you may have been able to solve this exercise without doing a thing; if
you determined your matrix size dynamically in the previous exercise instead of
relying on the 3 x 3 requirement, you solved both problems in one step.
However, almost everybody probably did a strict 3 x 3 solution for the first
exercise.

How do you think you would have fared if you had to start with this exercise?
How much harder would you have found the solution to be if you hadn't
encountered and solved the 3x3 case first?
=end

=begin
It did turn out that the bulk of my solution for this exercise is the same as
the one for the previous exercise. I only really had to figure out how to first
initialize the result matrix with the right number of columns.

I think I would have fared just fine if I had to start with this exercise. It
would have taken me more time, certainly, because for my approach I have to
figure out how to first dynamically construct a new matrix array with the right
number of empty subarrays; whereas for the previous exericse, I simply
initialized a new array with three empty subarrays. The previous exercise, in
some sense, really is just another example for this exercise.

I see the point of splitting this question into two though. It's smart to
simplify a bigger problem into a smaller one first, solve that, and then try to
perhaps generalize that solution to solve the bigger problem.
=end
