# A 90-degree rotation of a matrix produces a new matrix in which each side of the 
# matrix is rotated clockwise by 90 degrees. For example, the 90-degree rotation 
# of the matrix shown above is:

# 1  5  8 -->  # 3  4  1   
# 4  7  2 -->  # 9  7  5
# 3  9  6 -->  # 6  2  8

# A 90 degree rotation of a non-square matrix is similar. For example, the rotation of:

# 3  4  1  -->  # 9  3 
# 9  7  5  -->  # 7  4 
#          -->  # 5  1 

# Write a method that takes an arbitrary matrix and rotates it 90 degrees clockwise as shown above.

# - each new row is created by taking the inverse column
# - row 1 = m[0][2], m[0][1], m[0][0]
# - row 2 = m[1][2], m[1][1], m[1][0]
# - row 3 = m[2][2], m[2][1], m[2][0]

def rotate90(matrix)
  new_rows = []
  num_columns = matrix[0].size
  num_rows = matrix.size
  num_columns.times do |column_i|
    new_row = []
    (num_rows-1).downto(0) do |row_i|
      new_row << matrix[row_i][column_i]
    end
    new_rows << new_row

  end
new_rows
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

# Further Exploration
# Can you modify your solution to perform 90, 180, 270, and 360 degree rotations based on an argument?

# degrees must be a multiple of 90
def rotate_far(degrees, matrix)
  rotations = ( degrees / 90 ) % 4
  rotations.times do |_|
    matrix = rotate90(matrix)
  end
matrix
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

p rotate_far(180, matrix1) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p rotate_far(540, matrix1) == [[6, 9, 3], [2, 7, 4], [8, 5, 1]]
p rotate_far(270, matrix1) == [[8, 2, 6], [5, 7, 9], [1, 4, 3]]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

p rotate_far(90, matrix2) == [[5, 3], [1, 7], [0, 4], [8, 2]]
p rotate_far(180, matrix2) == [[8, 0, 1, 5], [2, 4, 7, 3]]
p rotate_far(900, matrix2) == [[8, 0, 1, 5], [2, 4, 7, 3]]
