# frozen_string_literal: true

# Input:  A matrix of M x N elements (M rows, N columns),
# Return value:  All elements of the matrix in diagonal order.
#  Example input:
# [
#  [ 1, 2, 3 ],
#  [ 4, 5, 6 ],
#  [ 7, 8, 9 ]
# ]
# Example Output:  [1, 2, 4, 7, 5, 3, 6, 8, 9]

def diagonal_traversal(matrix)
  array = []
  return array if matrix.empty? || matrix[0].empty?

  i = 0
  j = 0

  switch = 0 # 0 for up, 1 for down

  while i + j < (matrix.length - 1) + (matrix[0].length - 1)
    array << matrix[i][j]

    if switch.zero?
      if j + 1 == matrix[0].length || (i - 1).negative?
        if j + 1 == matrix[0].length
          i += 1
        elsif (i - 1).negative?
          j += 1
        end
        switch = 1
      else
        i -= 1
        j += 1
      end
    elsif switch == 1
      if i + 1 == matrix[0].length || (j - 1).negative?
        if i + 1 == matrix[0].length
          j += 1
        elsif (j - 1).negative?
          i += 1
        end
        switch = 0
      else
        j -= 1
        i += 1
      end
    end

  end

  array << matrix[i][j]
  array
end

p diagonal_traversal([[1, 2, 3], [4, 5, 6], [7, 8, 9]])
