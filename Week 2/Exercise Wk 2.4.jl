using Pkg
Pkg.add("Zygote")
using Zygote
# Define a simple function
function f(x)
    return x^3 + 2*x^2 + x
end

# Compute the gradient of the function at x = 2
x = 2.0
gradient = Zygote.gradient(f, x)[1]
println("Gradient of f at x = $x: $gradient") # Expected output: Gradient of f at x = 2: 21.0