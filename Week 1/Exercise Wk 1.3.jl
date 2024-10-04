# Greet function for Strings
function greet(name::String)
    return "Hello, $name Welcome!"
end

# Greet function for Integers
function greet(num::Int)
    return "Hello! You are $num years old."
end

# Greet function for any other type
function greet(x::Any)
    return "Hello! Stranger"
end

println(greet("Amar"))  # "Hello, Amar! Welcome!"
println(greet(19))       # "Hello! You are 19 years old."
println(greet(3.14))     # "Hello! Stranger"