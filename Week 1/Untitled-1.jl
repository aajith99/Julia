println("Hello, Julia!")
# Numerical Types
int_var::Int64 = 42                     # Integer (default Int64)
unsigned_var::UInt8 = UInt8(255)        # Unsigned 8-bit integer
float_var::Float64 = 3.14               # Floating-point number (default Float64)
float32_var::Float32 = Float32(2.71)    # 32-bit floating-point number

# Character and String Types
char_var::Char = 'A'                    # Single Character
string_var::String = "Hello World"      # String

#Boolean Type
bool_var::Bool = true                   # Boolean value (true or false)

# Creating an array of integers
arr = [1, 2, 3, 4, 5]

# Accessing elements
println(arr[1])                         # Output: 1

# Modifying an element
arr[2] = 10

# Adding a new element
push!(arr, 6)                           # arr becomes [1, 10, 3, 4, 5, 6]

# Creating a tuple with mixed Types
t = (1, "hello", 3.14)

# Accessing elements
println(t[2])                           # Output: "hello"

#Tuples are immutable; this will cause an error
# t[1] = 5

# Creating a dictionary with String keys and Int values
d = Dict("a" => 1, "b" => 2)

# Accessing values by key
println(d["a"])                         # Output: 1

# Adding a new key-value pair
d["c"] = 3

# Modifying an existing value
d["a"] = 10                             # d becomes Dict("a" => 10, "b" => 2, "c" => 3)

# Long form
function add(x, y)
    return x + y
end

# Short form
add_short(x, y) = x + y

println(add(2,3))                       # Output: 5
println(add_short(2,3))                 # Output: 5

# Defining multiple methods for the same function name
function greet(name::String)
    println("Hello, $name")
end

function greet(age::Int)
    println("You are $age years old.")
end

greet("Alice")                          # Output: Hello, Alice
greet(25)                               # Output: You are 25 years old.

# Iterating over a range
for i in 1:5
    println("Interation $i")
end

# Iterating over an array
fruits = ["apple", "banana", "cherry"]
for fruit in fruits
    println(fruit)
end

# Basic while loop
count = 1
while count <= 5
    println("Count is $count")
    count += 1
end 

# Using break in a loop
for i in 1:10
    if i == 5
        println("Breaking at i = $i")
        break
    end
    println(i)
end

# Using continue in a loop
for i in 1:5
    if i == 3
        println("Skipping iteration $i")
        continue
    end
    println("Iteration $i")
end 

using Pkg
# Installing package
Pkg.add("PackageName")
# using package
using PackageName

# Define input and output file names
input_file = "input.txt"
output_file = "output.txt"

try
    # Read from the input file
    file_content = read(input_file, String)
    println("Content read from file:")
    println(file_content)

    # Process the data (e.g., convert to uppercase)
    processed_content = uppercase(file_content)

    # Write the processed content to the output file
    open(output_file, "w") do file
    write(file, processed_content)
    end
    
    println("Processing complete. Check the output file.")
catch e
println("An error occurred: ", e)
end


