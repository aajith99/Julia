function sum_of_evens(n::Int)
    sum = 0
    for i in 1:n
        if i % 2 == 0           # Modulus function which gives remainder after dividing
            sum += i            # Increment 'sum' by one after each loop
        end
    end
    return sum
end

x = sum_of_evens(10)
println("Your final sum is $x")