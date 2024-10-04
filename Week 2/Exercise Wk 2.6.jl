using Zygote
# Define the macro
macro diff_macro(expr)
    # Create value_func and deriv_func
    return quote
        # Define value_func to compute the value of the expression
        @eval function value_func(x)
            return $(expr)
        end

        # Define deriv_func to compute the derivative using Zygote
        @eval function deriv_func(x)
            return Zygote.gradient(x->$(expr), x)[1]
        end
    end
end
# Example usage
@diff_macro x^2 + 3*x + 5
# Test the generated functions
println("value at x = 2: ", value_func(2)) # Should return the value of x*2 + 3x + 5 at x=2
println("Derivative at x = 2: ", deriv_func(2)) # Should return the derivative at x=2