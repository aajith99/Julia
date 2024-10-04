using ForwardDiff

macro gradient_expr(expr)
    return quote
        @eval function gradient_func(values::Vector)
            f = $(expr) # No need for esc in this case
            grad = ForwardDiff.gradient(x -> f(x...), values)
            return grad
        end
    end
end

# Example usage
@gradient_expr (x, y) -> x^2 + y^2

# Create the gradient function
gradient_func = gradient_func

# Compute the gradient at the point (1, 2)
result = gradient_func([1.0, 2.0]) # Pass values as a vector
println("Gradient at (1, 2): ", result)
