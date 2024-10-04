#Non-in-place Update:
function increment_non_inplace(x)
    return x .+ 1
end

a = [1, 2, 3]
b = increment_non_inplace(a)
println(b) # [2, 3, 4]
println(a) # [1, 2, 3] (a is not modified)

#In-place Update:

function increment_inplace!(x)
    x .= x .+ 1 # .+= means element-wise addition and in-place modification
end

a = [1, 2, 3]
increment_inplace!(a)
println(a) # [2, 3, 4] (a is modified in place)