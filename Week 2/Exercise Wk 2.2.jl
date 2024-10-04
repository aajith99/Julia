function sum_2x2(matrix::Matrix{Float64})
    return sum(matrix)
end
function sum_3x3(matrix::Matrix{Float64})
    return sum(matrix)
end

# Test for 2x2 matrix
matrix_2x2 = [1.0 2.0; 3.0 4.0]
result_2x2 = sum_2x2(matrix_2x2)
println("Sum of 2x2 matrix: ",  result_2x2) # Expected: 10.0

# Test for 3x3 matrix
matrix_3x3 = [1.0 2.0 3.0; 4.0 5.0 6.0; 7.0 8.0 9.0]
result_3x3 = sum_3x3(matrix_3x3)
println("Sum of 3x3 matrix: ", result_3x3) # Expected: 45.0