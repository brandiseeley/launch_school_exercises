# A 3 x 3 matrix can be represented by an Array of Arrays in which the main
# Array and all of the sub-Arrays has 3 elements. For example:

# 1  5  8
# 4  7  2
# 3  9  6

# can be described as an array of arrays:

# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]

# The transpose of a 3 x 3 matrix is the matrix that results from exchanging 
# the columns and rows of the original matrix. For example, the transposition 
# of the array shown above is:

# 1  4  3
# 5  7  9
# 8  2  6

# Write a method that takes a 3 x 3 matrix in Array of Arrays format and returns 
# the transpose of the original matrix. Note that there is a Array#transpose 
# method that does this -- you may not use it for this exercise. You also are
# not allowed to use the Matrix class from the standard library. Your task is 
# to do this yourself.

# Take care not to modify the original matrix: you must produce a new matrix and 
# leave the original matrix unchanged.

# - 3 times, create a new row
#     - create a row = []
#     - iterate through old rows
#     - add the ith index from the old rows to the new row
#     - push new row into final rows

def transpose(matrix)
  rows = []
  matrix.size.times do |index|
    new_row = matrix.map do |row|
      row[index]
    end
    rows << new_row
  end
rows
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

# Further Exploration
# Write a transpose! method that transposes a matrix in place. The obvious 
# solution is to reuse transpose from above, then copy the results back 
# into the array specified by the argument. For this method, don't use 
# this approach; write a method from scratch that does the in-place transpose.

# 1  5  8 ---> # 1  4  3
# 4  7  2 ---> # 5  7  9
# 3  9  6 ---> # 8  2  6

# 1  5  8 ---> # 1  4  3
# 4  7  2 ---> # 5  7  9
# 3  9  6 ---> # 8  2  6

# [0][1] swaps with [1][0]
# [1][2] swaps with [2][1]
# [0][2] swaps with [2][0]

def transpose!(matrix)
  matrix[0][1], matrix[1][0] = matrix[1][0], matrix[0][1]
  matrix[1][2], matrix[2][1] = matrix[2][1], matrix[1][2]
  matrix[0][2], matrix[2][0] = matrix[2][0], matrix[0][2]
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

transpose!(matrix)

p matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
